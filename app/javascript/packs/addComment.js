const inputField = document.getElementById('comment_text');
const buttons = document.getElementById('new-comment-buttons')
const cancelBtn = document.getElementById('cancel-btn');
const submitBtn = document.getElementById('submit-btn');

//test for attachments
const add_button = document.getElementById('add-attach-btn')              // visible button
const form_choose_file_btn = document.getElementById("attachment_name")   // choose file button
const attach_form = document.getElementById('new_attachment')             // form to be filled with file name, user id, entry id...
const submit_button = document.querySelector(".button-submit")

console.log(submit_button)
console.log(attach_form)
console.log(form_choose_file_btn)
console.log(add_button)

console.log(inputField)
console.log(buttons)
console.log(cancelBtn)
console.log(submitBtn)

function addEventListenerforNewComment() {
  inputField.addEventListener('focusin', showButtons);
  inputField.addEventListener('focusout', hideButtonsIfEmpty);
  inputField.addEventListener('keyup', toggleSubmitDisable);
  cancelBtn.addEventListener('click', hideButtons);
  submitBtn.addEventListener('click', hideButtons);
}

const showButtons = () => {
  if (buttons.classList.contains('d-none')) {
    buttons.classList.remove('d-none');
    inputField.classList.add('active');
  }
  if (inputField.value === '') {
    submitBtn.disabled = true;
  }
}

const hideButtonsIfEmpty = () => {
  if (inputField.value === '' && !buttons.classList.contains('d-none')) {
    hideButtons();
  }
}

const hideButtons = () => {
  inputField.classList.remove('active');
  buttons.classList.add('d-none');
}

const toggleSubmitDisable = () => {
  if (inputField.value === '') {
    submitBtn.disabled = true;
  } else {
    submitBtn.disabled = false;
  }
}

addEventListenerforNewComment()




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
