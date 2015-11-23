Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]

  root 'welcome#index'

  scope :stl, as: :stl do
    get ':filename' => 'stl#file', as: :file
  end

  resources :order, only: [:new, :create] do
    post 'new/tupper' => 'order#new_tupper', as: :new_tupper
    post 'new/collect' => 'order#new_collect', as: :new_collect
  end
  scope :order, as: :order do
    post 'new/kit' => 'order#new_kit', as: :new_kit
  end
  scope :admin, as: :admin do
    get '' => 'admin#index', as: :index
  end

  namespace :admin do
    resources :tupper
    resources :kit
    resources :order do
      post 'download/zip' => 'order#download_zip', :as => 'download_zip'
    end

    as :user do
      get 'users/password/edit' => 'user#password_edit', :as => 'edit_user_password'
      patch 'users/password/:id' => 'user#password_update', :as => 'user_password'
    end
  end
end
