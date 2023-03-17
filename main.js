const {app, BrowserWindow} = require("electron")

const createWindow = () => {
	var splash = new BrowserWindow({
		width: 600,
		height: 193, 
		transparent: true, 
		frame: false, 
		alwaysOnTop: true 
	})
	splash.loadFile("splash.html")
	splash.center()
	// Create the browser window.
	const mainWindow = new BrowserWindow({
		autoHideMenuBar: true,
		resizable: false,
		width: 466,
		height: 770,
		show: false,
		useContentSize: true,
		maximizable: false,
		webPreferences: {
			nodeIntegration: true,
			contextIsolation: false
		}
	})

	// and load the index.html of the app.
	mainWindow.loadFile("index.html")
	mainWindow.setIcon("build/icon.ico")
	mainWindow.webContents.on("did-finish-load", function() {
		splash.close()
		mainWindow.show()
	})
	// Open the DevTools for debugging, only if not in production.
	if (!app.isPackaged) {
		mainWindow.webContents.openDevTools({mode: "detach"})
	}
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
	createWindow()

	app.on("activate", () => {
		// On macOS it's common to re-create a window in the app when the
		// dock icon is clicked and there are no other windows open.
		if (BrowserWindow.getAllWindows().length === 0) createWindow()
	})
})

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on("window-all-closed", () => {
	if (process.platform !== "darwin") app.quit()
})
