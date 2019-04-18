Rails.application.routes.draw do

  namespace :comments do
    get 'archives/index'
  end
  get 'comments/create'
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'entries#index'

  namespace :entries do
    resources :archives, only: [:index, :update]
  end

  namespace :comments do
    resources :archives, only: [:index, :update]
  end

  resources :entries, only: [:index, :show, :create, :update] do
    resources :attachments, only: [:create]
  end

  namespace :users do
    resources :pendings, only: [:index, :update]
  end

  resources :circles, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :update]
  resources :documents, only: [:index, :create]

  get 'comments/:id/bee', to: 'entries#bee', as: 'bee'
  post '/entries/:id/comments', to: 'comments#create', as: 'create_comment'
  get 'entries/:id/bookmark', to: 'entries#bookmark', as: 'bookmark'

  get 'bookmarks', to: 'entries#my_bookmarks', as: 'my_bookmarks'
  get 'dates', to: 'entries#dates', as: 'dates'

end
