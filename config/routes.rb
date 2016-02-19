Rails.application.routes.draw do
  namespace :admin do
    get '/contacts', :to => 'contacts#index'
    get '/contacts/:key', :to => 'contacts#show', :as => :contact
  end

  root :to => 'site#home'
  get '/prices' => 'site#prices'
  get '/aboutus' => 'site#aboutus'
  get '/contact' => 'site#contact'
  
  namespace :api do
    get '/contacts'                     => 'contacts#index'
    get '/contacts/key/:key'            => 'contacts#showbykey'
    get '/contacts/:id'                 => 'contacts#show', :as => :contact
    put '/contacts/key/:key'            => 'contacts#update'
    post '/contacts/key/:key/addvisit'  => 'contacts#addvisit'
    post '/contacts'                    => 'contacts#create'
  end
end
