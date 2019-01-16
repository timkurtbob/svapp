Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  resources :entries, only: [ :index, :show]
  get 'comments/:id/bee', to: 'entries#bee', as: 'bee'
end
