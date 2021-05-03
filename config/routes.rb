Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users 

  scope "(:locale)" do #, locale: /ja|ko/ 
    resources :users
    resources :posts
  end
end

# resources :like
# resources :comments, only: :create
