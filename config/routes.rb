Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'}
  get "admin" => 'homes#top'
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
