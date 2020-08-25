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

  get '/pets/:id', to: 'pets#show'

  get '/shelters/:id/pets/new', to: 'shelters/pets#new'
  post '/shelters/:id/pets', to: 'shelters/pets#create'

  get '/shelters/:id/pets/:id', to: 'pets#show'
end