Rails.application.routes.draw do
  get 'user/create'
  get 'user/show'
  get 'user/confirm_email', to: 'user#confirm_email'
  post 'auth', to: 'auth#create'
  delete 'auth', to: 'auth#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
