Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  root 'welcome#index'

  scope :stl, as: :stl do
    get ':filename' => 'stl#file', as: :file
  end

  resources :order, only: [:new, :create]
  scope :order, as: :order do
    post 'new/kit' => 'order#new_kit', as: :new_kit
  end
  scope :admin, as: :admin do
    get '' => 'admin#index', as: :index
  end

  namespace :admin do
    resources :tupper
    resources :kit
    resources :order
    as :user do
      get 'users/password/edit' => 'user#password_edit', :as => 'edit_user_password'
      patch 'users/password/:id' => 'user#password_update', :as => 'user_password'
    end
  end
end
