Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/searches" => "searches#index"

    get "/movies" => "movies#index"
    get "/movies/:id" => "movies#show"
    post "/movies/:id" => "movies#update"
  end
end
