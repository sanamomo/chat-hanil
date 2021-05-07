Rails.application.routes.draw do
  get 'messages/index'
  root to: 'posts#index'
  devise_for :users 

  scope "(:locale)" do #, locale: /ja|ko/ 
    resources :users
    resources :posts
    resources :rooms do
      resources :messages, only: [:index, :create]
    end
  end
end

# resources :like
# resources :comments, only: :create
