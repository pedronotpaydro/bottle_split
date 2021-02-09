Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # USERS
    post "/users" => "users#create"
    # SESSIONS
    post "/sessions" => "sessions#create"
    # BEERS
    get "/beers" => "beers#index"
    get "/beers/:id" => "beers#show"
    post "/beers" => "beers#create"
    patch "/beers/:id" => "beers#update"
    delete "/beers/:id" => "beers#destroy"
    # EVENTS
    get "/events" => "events#index"
    get "/events/:id" => "events#show"
    post "/events" => "events#create"
    patch "/events/:id" => "events#update"
    delete "/events/:id" => "events#destroy"
    get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }
  end
  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }
end
