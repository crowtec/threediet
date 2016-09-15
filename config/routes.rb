Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  root 'welcome#index'

  #scope :stl, as: :stl do
  #  get ':filename' => 'stl#file', as: :file
  #end
  get 'us' => 'welcome#us'
  get 'how_it_works' => 'welcome#how_it_works'
  get 'shop' => 'welcome#general_shop'
  get 'kits-shop' => 'welcome#kits_shop'

  resources :kit, only: [:index]

  resources :order, only: [:new, :create]
  scope :order do
    post 'new' => 'order#new', as: :new_order_post
  end

  scope :admin, as: :admin do
    get '' => 'admin#index', as: :index
    #get ':id/edit' => 'admin#edit', as: :edit
    #delete ':id' => 'admin#destroy', as: :destroy
  end

  namespace :admin do
    resources :tupper
    resources :kit
    resources :color
    resources :order do
      post 'download/zip' => 'order#download_zip', :as => 'download_zip'
    end

    as :user do
      get 'users/password/edit' => 'user#password_edit', :as => 'edit_user_password'
      patch 'users/password/:id' => 'user#password_update', :as => 'user_password'
    end
  end
end
