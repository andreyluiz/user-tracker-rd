Rails.application.routes.draw do
  get '/contacts'                     => 'contacts#index'
  get '/contacts/key/:key'            => 'contacts#showbykey'
  get '/contacts/:id'                 => 'contacts#show', :as => :contact
  put '/contacts/key/:key'            => 'contacts#update'
  post '/contacts/key/:key/addvisit'  => 'contacts#addvisit'
  post '/contacts'                    => 'contacts#create'
end
