Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets', to: 'shelters/pets#index'
  get '/pets/:id/edit', to: 'pets#edit'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets/new', to: 'shelters/pets#new'
  post '/shelters/:id/pets', to: 'shelters/pets#create'
  get '/shelters/:id/pets/:id', to: 'pets#show'
  delete '/pets/:id', to: 'shelters/pets#destroy'

  get '/reviews', to: 'reviews#index'
  get '/shelters/:id/reviews', to: 'shelters/reviews#index'
  get '/reviews/:id/edit', to: 'reviews#edit'
  get '/reviews/:id', to: 'reviews#show'
  get '/shelters/:id/review/new', to: 'shelters/reviews#new'
  post '/shelters/:id/reviews', to: 'shelters/reviews#create'
  get '/shelters/:id/reviews/:id', to: 'reviews#show'
  delete '/reviews/:id', to: 'shelters/reviews#destroy'
end
