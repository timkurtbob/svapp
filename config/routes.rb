Rails.application.routes.draw do
  devise_for :users

  root to: 'entries#index'

  resources :entries, only: [ :index, :show, :create, :update]

  get 'comments/:id/bee', to: 'entries#bee', as: 'bee'
  post '/entries/:id/comments', to: 'entries#add_comment', as: 'add_comment'
  get 'entries/:id/bookmark', to: 'entries#bookmark', as: 'bookmark'
  post 'entries/:id/deactivate', to: 'entries#deactivate', as: 'deactivate'

  # get 'bookmarks', to: 'entries#my_bookmarks', as: 'my_bookmarks'
end
