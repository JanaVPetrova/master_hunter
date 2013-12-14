MasterHunter::Application.routes.draw do
  scope module: :web do
    root to: "welcome#index"
    resources :users, only: [:create, :new]
  end
end
