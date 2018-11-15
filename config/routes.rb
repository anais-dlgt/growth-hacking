Rails.application.routes.draw do
  root to: 'home#student'
  get 'home/student', to: 'home#student'
  get 'home/index', to: 'home#index'
  get 'home/video', to: 'home#video'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
