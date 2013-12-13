MasterHunter::Application.routes.draw do
  scope module: :web do
    root to: 'users#new'

    resources :users, only: [:create, :new]
  end
end
