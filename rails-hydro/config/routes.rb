Rails.application.routes.draw do
  root 'static_pages#index'
  get 'dashboard' => 'static_pages#dashboard', as: 'dashboard'
  get 'work' => 'static_pages#work', as: 'work'
  get 'about' => 'static_pages#about', as: 'about'
  get 'contact' => 'contacts#new', as: 'contact'
  get 'contact' => 'contacts#new', as: 'contacts'
  post 'contact' => 'contacts#create'
  get 'contact/messages' => 'contacts#index', as: 'messages'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'members' => 'users#members'
  get 'users/manage/:id' => 'users#manage', as: 'manage'
  patch 'users/override/:id' => 'users#override', as: 'override'
  get 'testmail' => 'users#send_mail'
  resources :users
  resources :profile_pictures, only: [:new, :create]

  resources :articles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
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
