'use strict';
const path = require('path');
const http = require('https')
const fs = require('fs');
const ini = require('ini');

const {
	app,
	BrowserWindow,
	Menu
} = require('electron');
/// const {autoUpdater} = require('electron-updater');
const {
	is
} = require('electron-util');
const unhandled = require('electron-unhandled');
const debug = require('electron-debug');
const contextMenu = require('electron-context-menu');
const config = require('./src/js/config.js');
const menu = require('./src/js/menu.js');
const EventEmitter = require('events')
const loadingEvents = new EventEmitter()

unhandled();
debug();
contextMenu();

// Note: Must match `build.appId` in package.json
app.setAppUserModelId('com.Ryah.SDVDowngrader');

// Uncomment this before publishing your first version.
// It's commented out as it throws an error if there are no published versions.
// if (!is.development) {
// 	const FOUR_HOURS = 1000 * 60 * 60 * 4;
// 	setInterval(() => {
// 		autoUpdater.checkForUpdates();
// 	}, FOUR_HOURS);
//
// 	autoUpdater.checkForUpdates();
// }

// Prevent window from being garbage collected
let mainWindow;

const createMainWindow = async () => {
	const win = new BrowserWindow({
		title: app.name,
		show: false,
		width: 800,
		height: 600,
		icon: __dirname + '/src/assets/Icon.png',
		webPreferences: {
			preload: './src/js/preload.js',
			devTools: true,
			nodeIntegration: true,
			contextIsolation: false,
		},
	});

	win.on('ready-to-show', () => {
		win.show();
	});

	win.on('closed', () => {
		// Dereference the window
		// For multiple windows store them in an array
		mainWindow = undefined;
	});

	// await win.loadFile(path.join(__dirname, 'src/index.html'));

	return win;
};

// Download function

// Prevent multiple instances of the app
if (!app.requestSingleInstanceLock()) {
	app.quit();
}

app.on('second-instance', () => {
	if (mainWindow) {
		if (mainWindow.isMinimized()) {
			mainWindow.restore();
		}

		mainWindow.show();
	}
});

app.on('window-all-closed', () => {
	if (!is.macos) {
		app.quit();
	}
});

(async () => {
	await app.whenReady();
	Menu.setApplicationMenu(menu);
	mainWindow = await createMainWindow();
	mainWindow.loadFile('src/loading.html')

	// Our loadingEvents object listens for 'finished' before loading main page
	loadingEvents.on('finished', () => {
		mainWindow.loadFile('src/index.html')
	})

	loadingEvents.on('progress', percentage => {
        mainWindow.webContents.send('progress', percentage)
    })

	download('https://speed.hetzner.de/1GB.bin', '1GB.bin')
	// setTimeout(() => loadingEvents.emit('finished'), 3000)
})();

const download = (url, filename, closeCallback) => {
    const file = fs.createWriteStream(filename);

    http.get(url, function(response) {
        let total = 0;
        response.on('data', (c) => {
            total += c.length
            loadingEvents.emit('progress', total/response.headers['content-length'])
        })
        response.pipe(file)
        file.on('finish', function() {
        	file.close(() => loadingEvents.emit('finished'))
    	}).on('error', function(err) {
        	fs.unlink(dest);
    	})  
	})
}