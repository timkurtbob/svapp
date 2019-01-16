function addEventListenerforNewComment() {
  const inputField = document.getElementById('comment_text');
  inputField.addEventListener('focusin', showButtons);
  inputField.addEventListener('focusout', hideButtonsIfEmpty);

  const cancelBtn = document.getElementById('cancel-btn');
  cancelBtn.addEventListener('click', hideButtons)
}

const showButtons = () => {
  const buttons = document.querySelector('.form-actions')
  const inputField = document.getElementById('comment_text');
  if (buttons.classList.contains('hidden')) {
    buttons.classList.remove('hidden')
    inputField.classList.add('active')
  }
}

const hideButtonsIfEmpty = () => {
  const buttons = document.querySelector('.form-actions');
  const inputField = document.getElementById('comment_text');
  if (inputField.value === '' && !buttons.classList.contains('hidden')) {
    hideButtons();
  }
}

const hideButtons = () => {
  const inputField = document.getElementById('comment_text');
  const buttons = document.querySelector('.form-actions');
  inputField.classList.remove('active')
  buttons.classList.add('hidden');
}

export { addEventListenerforNewComment };
