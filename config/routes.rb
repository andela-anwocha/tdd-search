Rails.application.routes.draw do
  root to: "books#home"

  get "/", to: "books#home"

  post "/search", to: "books#search"
end
