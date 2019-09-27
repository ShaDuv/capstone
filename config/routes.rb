Rails.application.routes.draw do
  root to: 'topics#index'
  resources :topics do
    resources :profiles, :only => [:new, :create, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
