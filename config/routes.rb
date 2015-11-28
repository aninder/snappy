Rails.application.routes.draw do
  root 'questions#all'
  resources :users, only:[:new, :create] do
      resources :questions, only:[:create, :index, :show]
  end
  resource :session, only:[:new, :create, :destroy]

end
