const {
	preDownloadCheck,
	download,
	createCommand,
	runCommand,
	removeDir,
	removeFile,
	unzip
} = require("./utils")

function submitForm() {
	// Check if the form is filled in and if dotnet is installed
	preDownloadCheck().then(async function () {
		// Remove the old depotdownloader directory
		await removeDir("depotdownloader")

		// Download the DepotDownloader binary, so it doesn't have to be included in the source code
		await download("https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.4.7/depotdownloader-2.4.7.zip")

		// Unzip the DepotDownloader binary
		await unzip("depotdownloader-2.4.7.zip", "depotdownloader")

		// Clean up the old files
		await removeFile("depotdownloader-2.4.7.zip")
		// Run the final command
		await runCommand(createCommand())
	}).catch(function (error) {
		if (error === "emptyField") {
			console.error("Fill in all required fields")
			document.getElementById("emptywarning").hidden = false
		}
	})
}

// function submitDotnet() {
// 	const electron = require("electron")
// 	const os = process.platform.toString()
// 	document.getElementById("dotnetwarning").hidden = true
// 	if (os.includes("win")) {
// 		console.debug("Opened .NET download page for " + os.charAt(0).toUpperCase() + os.slice(1))
// 		void electron.shell.openExternal("https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.301-windows-x64-installer")
// 	}
// 	if (os.includes("linux")) {
// 		console.debug("Opened .NET download page for " + os.charAt(0).toUpperCase() + os.slice(1))
// 		void electron.shell.openExternal("https://docs.microsoft.com/en-us/dotnet/core/install/linux")
// 	}
// 	if (os.includes("darwin")) {
// 		console.debug("Opened .NET download page for" + os)
// 		//TODO: Apple Silicon(ARM64) URL
// 		void electron.shell.openExternal("https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-6.0.301-macos-x64-installer")
// 	}
// }

function openGitHub() {
	const electron = require("electron")
	console.debug("Opened GitHub page")
	void electron.shell.openExternal("https://github.com/Ryah/SDV-Downgrader/")
}

/* Everything below this line runs when the page is loaded */

// Add event listeners to the buttons
window.addEventListener("DOMContentLoaded", () => {
	// document.getElementById("dotnetalertbtn").addEventListener("click", submitDotnet)
	document.getElementById("downloadbtn").addEventListener("click", submitForm)
	document.getElementById("githubbtn").addEventListener("click", openGitHub)
})