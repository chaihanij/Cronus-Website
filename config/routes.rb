Rails.application.routes.draw do
  resources :documents
  resources :contacts
  resources :packages
  resources :operating_systems
  resources :products
  resources :image_json
  
  # ------------------
  # Config routes
  root 'static_pages#home'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :events
  resources :announcements do 
    collection do
      get 'feed'
    end
  end
  resources :wikis
  resources :images
  resources :users

  get '/download' , to:'static_pages#download'
  get '/contact-us' ,  to:'static_pages#contact'
  get '/static_announcement' ,  to:'static_pages#announcement'
  get '/static_event' ,  to:'static_pages#event'
  get '/static_wiki' ,  to:'static_pages#wiki'
  get '/static_document', to: 'static_pages#document'
  
  # API V1
  namespace :api, defaults: {:format=> 'json'} do
    namespace :v1 do
      resources :documents do
        collection do
            get 'document_by_prodcut'
        end 
      end
      resources :products do
        collection do
          get 'products_is_public'
        end
      end
    end
  end
  # -------------


  # namespace :admin do
  #   get '/', to:'static_pages#index'
  # end
  # namespace :admin do
  #   resources :users do 
  #     member do 
  #       post 'update_role'
  #     end 
  #   end 
  # end
  # namespace :admin do
  #   resources :wikis
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'static_pages#home'?

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
