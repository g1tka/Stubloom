Rails.application.routes.draw do
  root to: 'homes#top'
  get 'bootstraps/colors', to: 'bootstraps#colors'
  get 'bootstraps/modal', to: 'bootstraps#modal'
  get 'bootstraps/gridsystem', to: 'bootstraps#gridsystem'
  get 'bootstraps/navbar', to: 'bootstraps#navbar'
  get 'bootstraps/carousel', to: 'bootstraps#carousel'
  get 'pages/page1', to: 'pages#page1'
  get 'radii/radius', to: 'radii#radius'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
