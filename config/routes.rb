Rails.application.routes.draw do
  root 'welcome#index'

  get 'stl/:filename' => 'kit#stl_file'
  get 'kit' => 'kit#show'
end
