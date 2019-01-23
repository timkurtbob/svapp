Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'entries#index'

  resources :entries, only: [ :index, :show, :create, :update]

  get 'comments/:id/bee', to: 'entries#bee', as: 'bee'

  post '/entries/:id/comments', to: 'entries#add_comment', as: 'add_comment'
  get 'entries/:id/bookmark', to: 'entries#bookmark', as: 'bookmark'
  post 'entries/:id/deactivate', to: 'entries#deactivate', as: 'deactivate'

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  # get 'bookmarks', to: 'entries#my_bookmarks', as: 'my_bookmarks'
end
