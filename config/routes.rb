MasterHunter::Application.routes.draw do
  scope module: :web do
    root to: "posts#index"
    resources :users, only: [:create, :new]
    resources :welcome, only: [:index]
    resource :session, only: [:create, :destroy, :new]

    resources :posts, only: [:index, :show, :new, :create, :edit, :update]

    namespace :admin do
      resources :posts, only: [:show, :index, :destroy, :edit, :update] do
        member do
          patch :publish
        end
      end
    end
  end
end
