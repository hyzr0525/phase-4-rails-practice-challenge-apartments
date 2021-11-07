Rails.application.routes.draw do
  resources :apartments, only: [:index, :show, :create, :destroy, :update]
  resources :tenants, only: [:index, :show, :create, :destroy, :update]
  resources :leases, only: [:index, :create, :destroy]
end
