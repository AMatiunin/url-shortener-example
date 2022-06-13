Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/shorting", to: "url#short"
  get "/find", to: "url#find"

  get "/:short_url", to: "url#catch"
  root "url#index"
end
