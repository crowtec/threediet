Rails.application.routes.draw do
  devise_for :users
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

  namespace :admin, as: :admin do
    resources :tupper
    resources :kit
    resources :order
  end
end
