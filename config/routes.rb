Rails.application.routes.draw do
  resources :twitter_posts

  resources :facebook_posts

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:delete]

  root 'twitter_posts#index'
end
