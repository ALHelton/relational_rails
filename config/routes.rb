Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/palettes', to: 'palettes#index'
  get '/palettes/:id', to: 'palettes#show'
end
