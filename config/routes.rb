Rails.application.routes.draw do

  namespace :admin do
    get '/' => 'pages#dashboard'
    resources :users
    get '/hosts/positions' => 'hosts#positions'
    resources :hosts
    resources :news, except: [:show]
    resources :suggestions, except: [:show, :create, :new, :edit]
    resources :studentexpos, only: [:index]
  end

  localized do
    as :user do
      patch 'user/confirmation' => 'users/confirmations#update', :via => :patch, :as => :update_user_confirmation
    end
    devise_for :users, :controllers => {:registrations => 'users/registrations',
                                        :confirmations => 'users/confirmations'}

    resources :news
    resources :suggestions, only: [:new, :create, :show]
    resources :studentexpos, only: [:new, :create], path: 'studentexpo', path_names: { new: '' }
    get '/studentexpo/:id/:liuid' => 'studentexpos#show', as: :show_studentexpo

    get '/host' => 'static_pages#show', :page => 'host', as: :host
    resources :hosts, only: [:new, :create], path: 'host', path_names: { new: 'apply' }
    get '/host/:id/:liuid' => 'hosts#show', as: :show_host

    get '/' => 'static_pages#home', :as => :home

    # in order to have translated routes, these are needed
    get '/sponsorship' => 'static_pages#show', :page => 'sponsor/sponsor'
    get '/sponsorship/compare' => 'static_pages#show', :page => 'sponsor/compare'
    get '/sponsorship/compare/bronze' => 'static_pages#show', :page => 'sponsor/bronze', as: :sponsorship_bronze
    get '/sponsorship/compare/silver' => 'static_pages#show', :page => 'sponsor/silver', as: :sponsorship_silver
    get '/sponsorship/compare/gold' => 'static_pages#show', :page => 'sponsor/gold', as: :sponsorship_gold

    get '/about' => 'static_pages#show', :page => 'about/about'
    get '/about/contact' => 'static_pages#show', :page => 'about/contact'
    get '/about/previous-years' => 'static_pages#show', :page => 'about/previous', :as => :about_previous
  end

  root to: 'static_pages#home'
end
