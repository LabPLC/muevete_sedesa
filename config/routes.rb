SedesaApp::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/first_login', to: 'users#first_login', as: 'first_login'

  resources :relationships, only: [:create]

  resources :users, only: [:index] do
    get :following, :followers
  end

  resources :friend_relationships, only: [:create, :destroy]
  post "acciones/users", to: 'acciones#agregar', as: 'add_accion_user'
  get "acciones", to: 'acciones#index', as: 'acciones'
  get "acciones/users", to: 'acciones#user', as: 'accion_user'
  get "acciones/:id", to: 'acciones#show', as: 'accion'
  get "/perfil/:id", to: 'users#show', as: 'user_show'
  get "/users", to: 'users#index'
  get "/userhome", to: 'users#home', as: 'user_home'
  get "/userhome/todo", to: 'users#todo_acciones', as: 'todo_user_acciones'
  get "/userhome/done", to: 'users#done_acciones', as: 'done_user_acciones'
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', registrations: "users/sessions"}
  #get "static_pages/index"
  get "static_pages/ayuda"
  get "static_pages/info"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get "/.well-known/status" => "status#check"

  # You can have the root of your site routed with "root"
  root 'static_pages#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller acciones automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
