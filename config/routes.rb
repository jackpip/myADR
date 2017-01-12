Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  resources :shows
  get '/episodes/:token/lines_count' => 'episodes#lines_count'
  resources :episodes, param: :token do
    resources :characters
  end
  resources :cues

end
