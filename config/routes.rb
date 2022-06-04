Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :categories

  resources :products do
    collection do
      post :search
    end
    resources :product_sales_units, shallow: true, except: %i[index show]
  end

  resources :customers do
    collection do
      post :search
    end
  end

  resources :employees do
    collection do
      post :search
    end
  end

  resources :suppliers do
    collection do
      post :search
    end
  end

  resources :sales_units, except: :show

  post '/new-category', action: :create_new_category, controller: 'products', as: 'new_product_category'
end
