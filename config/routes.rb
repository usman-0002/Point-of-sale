Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :categories

  resources :products, except: :edit do
    collection do
      post :search
    end
  end

  post '/new-category', action: :create_new_category, controller: 'products', as: 'new_product_category'
end
