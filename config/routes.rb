Rails.application.routes.draw do
  root to: 'home#student'
  get 'home/student', to: 'home#student'
  get 'home/mairie', to: 'home#mairie'
  get 'home/video', to: 'home#video'
  post 'home/student', to: 'home#create'
  post 'home/mairie', to: 'home#create'
  post 'home/video', to: 'home#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
