Rails.application.routes.draw do
  root 'sphere_grid#index'
  
  get 'node_data', to: 'sphere_grid#node_data'
end
