Activenow::Application.routes.draw do
   root 'home#index'
   get 'debug' => 'home#debug'
   post 'auth/:provider/callback' => 'auth#callback'
   get 'auth/:provider/callback' => 'auth#callback'
   get 'insert_event' => 'home#insert_event'
   get 'get_location' => 'home#get_location'
   get 'find_local_event' => 'home#find_local_event'
end
