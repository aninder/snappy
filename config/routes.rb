Rails.application.routes.draw do
  root 'questions#index'
  resources :users, only:[:new, :create] do
      resources :questions, only:[:create]
  end
  resource :session, only:[:new, :create, :destroy]

end
