Rails.application.routes.draw do
  root 'sphere_grid#index'
  
  get 'node_data', to: 'sphere_grid#node_data'
  post 'toggle_node', to: 'sphere_grid#toggle_node'
  get 'character_info', to: 'sphere_grid#character_info'
end
