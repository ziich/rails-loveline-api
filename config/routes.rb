
Rails.application.routes.draw do
        post '/login', to: "login#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lovelines, only: [:index, :create, :show]

      resources :users, only: [:index, :create, :update, :show, :destroy]


      resources :posts, only: [ :index, :show, :create, :destroy ] do
          collection do
            get :for_current_user
          end
        resources :comments, only: [:index, :create]
      end
      resources :likes, only: [] do
        collection do
          post :like
          post :unlike
        end
      end
    end
  end
end
