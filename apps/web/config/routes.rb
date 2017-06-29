# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

# post '/videogames', to: 'videogames#create'
# get '/videogames/new', to: 'videogames#new'
# get '/videogames', to: 'videogames#index'
# root to: 'home#index'

#This is the equivalente of the routes above
root to: 'home#index'
resources :videogames, only: [:index, :new, :create]
