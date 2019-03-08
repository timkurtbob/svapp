const add_document_button = document.getElementById('add-document-btn')   // visible file button
const add_image_button = document.getElementById('add-image-btn')         // visible image button
const form_choose_file_btn = document.getElementById("attachment_name")   // choose file button
const file_type_field = document.getElementById("attachment_file_type")   // "document" or "image"
const attach_form = document.getElementById('new_attachment')             // form to be filled with file name, user id, entry id...
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

//setting file type
function setFileTypeToDocument(){
  file_type_field.value="document"
  clickUploadAttachButton()
}
function setFileTypeToImage(){
  file_type_field.value="image"
  clickUploadAttachButton()
}

function addEventListenerToAddDocumentBtn() {
  add_document_button.addEventListener('click', setFileTypeToDocument)
}

function addEventListenerToAddImageBtn() {
  add_image_button.addEventListener('click', setFileTypeToImage)
}

addEventListenerToAttachForm();
addEventListenerToAddDocumentBtn();
addEventListenerToAddImageBtn();
