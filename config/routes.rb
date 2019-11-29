Rails.application.routes.draw do
  
  resources :articles do  
  	get :active, on: :member 
  	member do #to perform something on particular object
  		post :active
  	end
  	collection do #irrestpective of objects
  		get :search
  	end
  		resources :comments do
  			member do
  				post :active
  			end
  			collection do
  				get :search
  			end
  		end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 