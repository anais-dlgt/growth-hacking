Rails.application.routes.draw do
  root to: 'home#student'
  get 'home/student', to: 'home#student'
  post '/home/student' , to: 'home#create'
end
