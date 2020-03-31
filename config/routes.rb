Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  namespace :tweets do
    resources :searches, only: :index
  end
  resources :tweets do
    resources :comments, only: :create
    collection do  # この行は削除する
      get 'search'  # この行は削除する
    end  # この行は削除する
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
        #[tweets]コントローラ名
end
