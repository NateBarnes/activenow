Activenow::Application.routes.draw do
   root 'home#index'
   post 'auth/:provider/callback' => 'auth#callback'
   get 'auth/:provider/callback' => 'auth#callback'
   get 'insert_event' => 'home#insert_event'
end
