const { exec } = require("child_process");

window.test = function() {
    alert("test");
}

document.getElementById('submit').onclick = () => {
    const select = document.querySelector("select[name='versionNum']")
    const value = select.value;
    const option = select.querySelector(`option[value='${value}']`)
    const vNum = option.innerText
    console.log(vNum)
}



