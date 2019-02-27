Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'entries#index'

  namespace :entries do
    resources :archives, only: [:index, :update]
  end

 resources :entries, only: [ :index, :show, :create, :update] do
    resources :attachments, only: [:create]

 end

  namespace :users do
    resources :pendings, only: [:index, :update]
  end

  resources :users, only: [:index, :show, :update]

  get 'comments/:id/bee', to: 'entries#bee', as: 'bee'


  post '/entries/:id/comments', to: 'entries#add_comment', as: 'add_comment'
  get 'entries/:id/bookmark', to: 'entries#bookmark', as: 'bookmark'

  get 'bookmarks', to: 'entries#my_bookmarks', as: 'my_bookmarks'
end
