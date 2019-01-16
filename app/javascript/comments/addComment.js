function addEventListenerforNewComment() {
  const inputField = document.getElementById('comment_text');
  inputField.addEventListener('focusin', showButtons);
  inputField.addEventListener('focusout', hideButtonsIfEmpty);
  inputField.addEventListener('keyup', toggleSubmitDisable)

  const cancelBtn = document.getElementById('cancel-btn');
  cancelBtn.addEventListener('click', hideButtons)

  const submitBtn = document.getElementById('submit-btn');
  submitBtn.addEventListener('click', hideButtons)
}

const showButtons = () => {
  const buttons = document.querySelector('.form-actions')
  const inputField = document.getElementById('comment_text');
  if (buttons.classList.contains('d-none')) {
    buttons.classList.remove('d-none')
    inputField.classList.add('active')
  }
}

const hideButtonsIfEmpty = () => {
  const buttons = document.querySelector('.form-actions');
  const inputField = document.getElementById('comment_text');
  if (inputField.value === '' && !buttons.classList.contains('d-none')) {
    hideButtons();
  }
}

const hideButtons = () => {
  const inputField = document.getElementById('comment_text');
  const buttons = document.querySelector('.form-actions');
  inputField.classList.remove('active')
  buttons.classList.add('d-none');
}

const toggleSubmitDisable = () => {
  const inputField = document.getElementById('comment_text');
  const submitBtn = document.getElementById('submit-btn');
  if (inputField.value === '') {
    submitBtn.disabled = true
  } else {
    submitBtn.disabled = false
  }
}

export { addEventListenerforNewComment };
