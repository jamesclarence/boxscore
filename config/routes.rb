Rails.application.routes.draw do

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users
  resources :teams do
    resources :players
    resources :games
  end
  
  root to: 'welcome#index'

end
