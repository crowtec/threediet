Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'stl/:filename' => 'kit#stl_file'

  resources :order, only: [:new, :create]
  scope :order, as: :order do
    post 'new/kit' => 'order#new_kit', as: :new_kit
  end

  scope :admin, as: :admin do
    get '' => 'admin#index', as: :index
    resources :tupper
    resources :kit
  end
end
