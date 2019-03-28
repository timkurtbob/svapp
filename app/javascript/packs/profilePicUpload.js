const chooseFileBtn = document.getElementById('user_pic');
const iconBtn = document.getElementById('profile-pic-upload-btn');



// opening file selection window
function clickChooseFileBtn() {
  chooseFileBtn.click();
}

function addEventListenerToIconBtn() {
  iconBtn.addEventListener('click', clickChooseFileBtn);
}

addEventListenerToIconBtn();
