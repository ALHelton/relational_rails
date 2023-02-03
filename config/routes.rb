Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/palettes', to: 'palettes#index'
  get '/palettes/:id', to: 'palettes#show'

  get '/paints', to: 'paints#index'
  # get '/paints/:id', to: 'paints#show'
end
