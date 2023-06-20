Rails.application.routes.draw do

  mount API::Base => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'

  root to: "pages#home"

  devise_for :users, path: '', path_names: {sign_out: 'logout'}, skip: [:registrations], controllers: {sessions: "sessions"} do
    # get 'forgot_password' => 'devise/passwords#new', as: :new_user_password
  end

  resource :dashboard, only:[:index], controller: :dashboard do
    get '', action: :index, as: ''

    resources :trucks, controller: 'dashboard/trucks'
    resources :customers, controller: 'dashboard/customers'
    resources :materials, controller: 'dashboard/materials'
    resources :suppliers, controller: 'dashboard/suppliers' do
      resources :materials, except: [:index, :show], controller: 'dashboard/suppliers/materials'
    end
    resources :proposals, controller: 'dashboard/proposals' do
      resources :quotes, except: [:index], controller: 'dashboard/proposals/quotes'
    end

    resources :settings, only: [:index], controller: 'dashboard/settings'
    resources :users, only: [:index], controller: 'dashboard/users'
    resource :billing, only: [:index], controller: 'dashboard/billing' do
      get '', action: :index, as: ''
    end
  end

  get 'admin/dashboard' => 'admin#dashboard', as: :admin_dashboard
  resource :admin, only:[:index], controller: :admin do
    get '', action: :dashboard

    resources :vendors, controller: 'admin/vendors'
    resources :settings, only: [:index], controller: 'admin/settings'

  end

  resource :dispatch, only: [:index], controller: 'dispatch' do
    get '', action: :index, as: ''
  end

  get 'theme/(:page)' => 'theme#show', as: 'theme'
end
