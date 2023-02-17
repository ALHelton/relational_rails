Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/palettes', to: 'palettes#index'
  get '/palettes/new', to: 'palettes#new'
  get '/palettes/:id', to: 'palettes#show'

  get '/paints', to: 'paints#index'
  get '/paints/:id', to: 'paints#show'

  get '/palettes/:id/paints', to: 'palette_paints#index'
  post '/palettes', to: 'palettes#create'

  get 'palettes/:id/edit', to: 'palettes#edit'
  patch '/palettes/:id', to: 'palettes#update'

  get '/palettes/:id/paints/new', to: 'palette_paints#new'
  post '/palettes/:id/paints', to: 'palette_paints#create'

  get '/paints/:id/edit', to: 'paints#edit'
  patch '/paints/:id', to: 'paints#update'

  delete "/palettes/:id", to: 'palettes#destroy'
  delete "/paints/:id", to: 'paints#destroy'
  delete "/palettes", to: 'palettes#destroy'
  # delete "/palettes/:id/paints", to: 'palette_paints#destroy'
end
