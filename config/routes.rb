MasterHunter::Application.routes.draw do
  scope module: :web do
    root to: "welcome#index"
    resources :users, only: [:create, :new]
    resources :welcome, only: [:index]
    resource :session, only: [:create, :destroy, :new]

    resources :posts
  end
end
