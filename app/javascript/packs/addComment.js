const inputField = document.getElementById('comment_text');
const buttons = document.querySelector('.form-actions')
const cancelBtn = document.getElementById('cancel-btn');
const submitBtn = document.getElementById('submit-btn');

function addEventListenerforNewComment() {
  inputField.addEventListener('focusin', showButtons);
  inputField.addEventListener('focusout', hideButtonsIfEmpty);
  inputField.addEventListener('keyup', toggleSubmitDisable)
  cancelBtn.addEventListener('click', hideButtons)
  submitBtn.addEventListener('click', hideButtons)
}

const showButtons = () => {
  if (buttons.classList.contains('d-none')) {
    buttons.classList.remove('d-none')
    inputField.classList.add('active')
  }
  if (inputField.value === '') {
    submitBtn.disabled = true
  }
}

const hideButtonsIfEmpty = () => {
  if (inputField.value === '' && !buttons.classList.contains('d-none')) {
    hideButtons();
  }
}

const hideButtons = () => {
  inputField.classList.remove('active')
  buttons.classList.add('d-none');
}

const toggleSubmitDisable = () => {
  if (inputField.value === '') {
    submitBtn.disabled = true
  } else {
    submitBtn.disabled = false
  }
}

addEventListenerforNewComment()
