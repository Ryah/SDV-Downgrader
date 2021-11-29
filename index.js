'use strict';
const path = require('path');
// const http = require('https');
const request = require('request');
const fs = require('fs');
const ini = require('ini');
const unhandled = require('electron-unhandled');
const debug = require('electron-debug');
const contextMenu = require('electron-context-menu');
const config = require('./src/js/config.js');
const menu = require('./src/js/menu.js');
const EventEmitter = require('events')
const loadingEvents = new EventEmitter()
const AdmZip = require("adm-zip");
const {
	app,
	BrowserWindow,
	Menu
} = require('electron');
/// const {autoUpdater} = require('electron-updater');
const {
	is
} = require('electron-util');

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

// Main function probably 
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

	loadingEvents.on('error', () => {
		mainWindow.loadFile('src/error.html')
	})

	// check if the DepotDownloader directory exists, and if it doesn't, download it.
	fs.access("./DepotDownloader", function(error) {
		if (error) {
			console.log("DepotDownloader not found. Downloading.")
			download('https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.4.5/depotdownloader-2.4.5.zip', 'DepotDownloader.zip')
		} else {
			console.log("DepotDownloader exists. Checking for config.ini");
			loadingEvents.emit('finished')
		}
	  })	  
})();


// Download function (call with download('url', 'filename'))
const download = (url, dest, cb) => {
    const file = fs.createWriteStream(dest);
    const sendReq = request.get(url);

    // verify response code
    sendReq.on('response', (response) => {
        if (response.statusCode !== 200) {
            return cb('Response status was ' + response.statusCode);
        }

        sendReq.pipe(file);
    });

    // close() is async, call cb after close completes
    file.on('finish', function () {
		var zip = new AdmZip("DepotDownloader.zip");
		var zipEntries = zip.getEntries();
		zip.extractAllTo(/*target path*/ "./DepotDownloader/", /*overwrite*/ true);
		file.close(()=> loadingEvents.emit('finished'))
	})

    // check for request errors
    sendReq.on('error', (err) => {
        fs.unlink(dest);
		loadingEvents.emit('error')
        return cb(err.message);
    });

    file.on('error', (err) => { // Handle errors
        fs.unlink(dest); // Delete the file async. (But we don't check the result)
		loadingEvents.emit('error')
        return cb(err.message);
    });
};
