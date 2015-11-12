Rails.application.routes.draw do
  root 'welcome#index'

  get 'stl/:filename' => 'kit#stl_file'

end
