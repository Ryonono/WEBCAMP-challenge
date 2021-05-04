Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end

end
