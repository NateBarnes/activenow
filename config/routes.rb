Activenow::Application.routes.draw do
   root 'home#index'
   match 'auth/:provider/callback' => 'auth#callback'
end
