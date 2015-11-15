Rails.application.routes.draw do
  root 'welcome#index'

  get 'stl/:filename' => 'kit#stl_file'

  resources :order, only: [:new, :create]
  scope :order, as: :order do
    post 'new/kit' => 'order#new_kit', as: :new_kit
  end
end
