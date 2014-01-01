MasterHunter::Application.routes.draw do
  scope module: :web do
    root to: "welcome#index"
    resources :users, only: [:create, :new]
    resources :welcome, only: [:index]
    resource :session, only: [:create, :destroy, :new]

    resources :posts, only: [:index, :show, :new, :create]
    resources :success_stories, only: [:index]

    namespace :admin do
      resources :posts, only: [:show, :index, :destroy, :edit, :update] do
        member do
          patch :publish
          patch :success
        end
      end
    end
  end
end
