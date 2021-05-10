Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions' }
  root 'public/homes#top'
  get "about" => "public/homes#about"
  namespace :public do
    resources :items, only: [:index, :show]
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'}
  get "admin" => 'admin/homes#top'
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
