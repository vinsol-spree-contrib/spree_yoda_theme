Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :badges
    resource :theme, only: [:update, :show]
  end
end
