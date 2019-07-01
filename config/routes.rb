Rails.application.routes.draw do
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/:id" => "users#show"

  get 'diaries/index' => "diaries/index"
  get "diaries/new" => "diaries#new"
  get "diaries/:id" => "diaries#show"
  post "diaries/create" => "diaries#create"
  get "diaries/:id/edit" => "diaries#edit"
  post "diaries/:id/update" => "diaries#update"
  post "diaries/:id/destroy" => "diaries#destroy"

  get '/' => "home#top"
end
