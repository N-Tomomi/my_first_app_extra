Rails.application.routes.draw do
  # devise_for :usersの記述により、ログイン・新規登録で必要なルーティングが生成
  devise_for :users

  root to: 'posts#index'
  resources :posts, except: :index

  resources :users, only: :show
  
end
