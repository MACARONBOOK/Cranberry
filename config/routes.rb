Rails.application.routes.draw do

  # 管理者用 URL /admin/sigh_in
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # customer用 URL customers/sign_in
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  scope module: :public do
    root to: "homes#top"
    get "homes/about"

    resources :items, only: [:index, :show]
    resources :delivery_addresses, only: [:index, :edit, :create, :update, :destroy]

    resource :customers, only: [:index, :edit], path_names: { edit: 'information/edit' } do
      get "/my_page" => "customers#show"
      patch "/information" => "customers#update"
      get "confirm"
      patch "withdraw"
      put "/users/:id/hide" => "users#hide", as: 'users_hide'
    end

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "/destroy_all" => "cart_items#destroy_all"
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
      post "confirm"
      get "thanks"
      end
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :show, :index, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:show, :index, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  # namespace :public do
  #   get 'customers/edit'
  #   get 'customers/show'
  # end
  # namespace :public do
  #   get 'delivery_addresses/edit'
  #   get 'delivery_addresses/index'
  # end
  # namespace :public do
  #   get 'orders/index'
  #   get 'orders/new'
  #   get 'orders/show'
  # end
  # # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  # end

  # namespace :admin do
  #   get 'customers/edit'
  #   get 'customers/index'
  #   get 'customers/show'
  # end
  # namespace :admin do
  #   get 'orders/show'
  # end
  # namespace :admin do
  #   get 'items/edit'
  #   get 'items/index'
  #   get 'items/new'
  #   get 'items/show'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :admin do
  #   get 'genres/edit'
  #   get 'genres/index'
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
