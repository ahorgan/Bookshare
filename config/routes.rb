Bookshare::Application.routes.draw do
  devise_for :users

  resources :books do
  	resources :notes, :shallow => true
  end
  resources :shares
  get 'notes/:id/new_reply', to: 'notes#new_reply', as: :note_new_reply

  root 'books#index'
  
end
