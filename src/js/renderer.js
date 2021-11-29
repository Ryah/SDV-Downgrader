const child_process = require('child_process');

document.getElementById('submit').onclick = () => {
	//Variable declarations
	var EinputFalse = document.getElementById("Einput").value == "";
	var EinputTrue = document.getElementById("Einput") &&
		document.getElementById("Einput").value;

	var PinputFalse = document.getElementById("Pinput").value == "";
	var PinputTrue = document.getElementById("Pinput") &&
		document.getElementById("Pinput").value;

	//Input field checks
	if (EinputFalse) {
		document.getElementById("Einptwrap").style.cssText =
			"border-color: red";
		document.getElementById("Etext").innerHTML =
			"Username - <small><i>This field is required<i><small>";
		document.getElementById("Etext").style.cssText =
			"color: red";
	}
	if (EinputTrue) {
		document.getElementById("Einptwrap").style.cssText =
			"border-color: #282e2e";
		document.getElementById("Etext").innerHTML =
			"Username";
		document.getElementById("Etext").style.cssText =
			"color: #636d6d";
	}
	if (PinputFalse) {
		document.getElementById("Pinptwrap").style.cssText =
			"border-color: red";
		document.getElementById("Ptext").innerHTML =
			"Password - <small><i>This field is required<i><small>";
		document.getElementById("Ptext").style.cssText =
			"color: red";
	}
	if (PinputTrue) {
		document.getElementById("Pinptwrap").style.cssText =
			"border-color: #282e2e";
		document.getElementById("Ptext").innerHTML =
			"Password";
		document.getElementById("Ptext").style.cssText =
			"color: #636d6d";
	}

	//Check if both input fields are filled
	if (EinputTrue && PinputTrue) {
		var einput = document.getElementById("Einput").value;
		var pinput = document.getElementById("Pinput").value;

		//Check version and download
		const select = document.querySelector("select[name='versionNum']")
		const value = select.value;
		const option = select.querySelector(`option[value='${value}']`)
		const vNum = option.innerText
		console.log("Downloading " + vNum)
		switch (vNum) {
			case "v1.0":
                document.getElementById("header-text").innerHTML = "Downloading v1.0";
				child_process.exec("start cmd /K /../../DepotDownloader/DepotDownloader.exe -app 413150 -depot 413151 -manifest 3352391531516945586 -username " + einput + " -password " + pinput + " -dir SDV1.0");
				break;
			case "v1.1":
                document.getElementById("header-text").innerHTML = "Downloading v1.1";
				child_process.exec("start cmd /K /../../DepotDownloader/DepotDownloader.exe -app 413150 -depot 413151 -manifest 7487215307508292747 -username " + einput + " -password " + pinput + " -dir SDV1.1");
				break;
			case "v1.2":
                document.getElementById("header-text").innerHTML = "Downloading v1.2";
				child_process.exec("start cmd /K /../../DepotDownloader/DepotDownloader.exe -app 413150 -depot 413151 -manifest 5793210319202900873 -username " + einput + " -password " + pinput + " -dir SDV1.2");
				break;
			case "v1.3":
                document.getElementById("header-text").innerHTML = "Downloading v1.3";
				child_process.exec("start cmd /K /../../DepotDownloader/DepotDownloader.exe -app 413150 -depot 413151 -manifest 3080804457574934302 -username " + einput + " -password " + pinput + " -dir SDV1.3");
				break;
			case "v1.4":
                document.getElementById("header-text").innerHTML = "Downloading v1.4";
				child_process.exec("start cmd /K /../../DepotDownloader/DepotDownloader.exe -app 413150 -depot 413151 -manifest 2373680906867811602 -username " + einput + " -password " + pinput + " -dir SDV1.4");
				break;
			case "v1.5":
                document.getElementById("header-text").innerHTML = "Downloading v1.5";
				child_process.exec("start cmd /K /../../DepotDownloader/DepotDownloader.exe -app 413150 -depot 413151 -manifest 4487511898025325586 -username " + einput + " -password " + pinput + " -dir SDV1.5");
				break;
			default:
				alert("i don't know how you got here what did you do");
				break;
		}
	}
}
