const add_button = document.getElementById('add-attach-btn')              // visible button
const form_choose_file_btn = document.getElementById("attachment_name")   // choose file button
const attach_form = document.getElementById('new_attachment')             // form to be filled with file name, user id, entry id...
const submit_button = document.querySelector(".button-submit")            // submit button


function clickSubmitAttachButton() {
  submit_button.click();
}

function addEventListenerToAttachForm() {
  if (attach_form) {
    attach_form.addEventListener('change', clickSubmitAttachButton)
  }
}

function clickUploadAttachButton() {
  form_choose_file_btn.click();
}

function addEventListenerToAddAttachBtn() {
  add_button.addEventListener('click', clickUploadAttachButton)
}

addEventListenerToAttachForm();
addEventListenerToAddAttachBtn();
