Rails.application.routes.draw do

	root 'pages#home'
	get 'about',to:'pages#about'
  get 'signup',to:'users#new'
  resources :users, except:[:new]
	resources :articles

  get 'login',to:'sessions#new'
  post 'login',to:'sessions#create'
  delete 'logout',to:'sessions#destroy'
  # For deitails on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
