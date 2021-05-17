Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions:      'public/sessions' }
  root 'public/homes#top'
  get "about" => "public/homes#about"
  get "orders/complete" => "public/orders#complete"
  get "customers/unsubscribe" => "public/customers#unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"
  post "orders/confirm" => "public/orders#comfirm"
  get "orders/complete" => "public/orders#complete"
  namespace :public do
    resources :cart_items, only: [:index, :update, :destroy, :create, :destroy_all]
    resources :items, only: [:index, :show]
    resources :address, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'}
  get "admin" => 'admin/homes#top'
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end

end
