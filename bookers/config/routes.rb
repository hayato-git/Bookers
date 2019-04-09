Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#top"
  resources :posts
  delete 'posts/:id' => 'posts#destroy', as: 'destroy_post'
  
end
