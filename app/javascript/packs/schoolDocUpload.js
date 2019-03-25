const add_document_button = document.getElementById('add-document-btn')   // visible file button
const form_choose_file_btn = document.getElementById("document_name")   // choose file button
const attach_form = document.getElementById('new_document')             // form to be filled with file name, user id, entry id...
const submit_button = document.querySelector(".submit-btn")               // submit button


function clickSubmitAttachButton() {
  submit_button.click();
}

function addEventListenerToAttachForm() {
  if (attach_form) {
    attach_form.addEventListener('change', clickSubmitAttachButton)
  }
}

// opening file selection window
function clickUploadAttachButton() {
  form_choose_file_btn.click();
}

function addEventListenerToAddDocumentBtn() {
  add_document_button.addEventListener('click', clickUploadAttachButton)
}

addEventListenerToAttachForm();
addEventListenerToAddDocumentBtn();
