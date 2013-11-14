Activenow::Application.routes.draw do
   root 'home#index'
   post 'auth/:provider/callback' => 'auth#callback'
   get 'auth/:provider/callback' => 'auth#callback'
end
