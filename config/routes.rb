MasterHunter::Application.routes.draw do
  scope module: :web do
    root to: "posts#index"
    resources :users, only: [:create, :new]
    resources :welcome, only: [:index]
    resource :session, only: [:create, :destroy, :new]

    resources :posts

    namespace :admin do
      resources :posts, only: [:show, :index, :destroy]
    end
  end
end
