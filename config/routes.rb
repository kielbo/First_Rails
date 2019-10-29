Rails.application.routes.draw do

	root 'pages#home'
	get 'about',to:'pages#about'
  get 'signup',to:'users#new'
  resources :users, except:[:new]
	resources :articles
  # For deitails on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
