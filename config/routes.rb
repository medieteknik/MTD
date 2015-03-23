Rails.application.routes.draw do

  namespace :admin do
    get '/' => 'pages#dashboard'
    resources :users
    get '/hosts/positions' => 'hosts#positions'
    resources :hosts, except: :show
    resources :companies, except: :show
    post '/companies/:id/image' => 'companies#image_callback', as: :company_image
    post '/companies/booths' => 'companies#update_booths', as: :update_companies_booths
    resources :lectures, except: :show
    post '/lectures/:id/image' => 'lectures#image_callback', as: :lecture_image
    resources :news, except: :show
    resources :photo_albums, path: 'photos' do
      resources :images, only: :destroy
    end
    post '/photos/:id/image' => 'photo_albums#image_callback', as: :photo_album_image_callback
    resources :suggestions, except: [:show, :create, :new, :edit]
    resources :studentexpos, only: :index
  end

  localized do
    get '/' => 'static_pages#home', :as => :home

    as :user do
      patch 'user/confirmation' => 'users/confirmations#update', :via => :patch, :as => :update_user_confirmation
    end
    devise_for :users, :controllers => {:registrations => 'users/registrations',
                                        :confirmations => 'users/confirmations'}

    resources :news
    resources :suggestions, only: [:new, :create, :show]
    resources :studentexpos, only: [:new, :create], path: 'studentexpo', path_names: {new: ''}
    get '/studentexpo/:id/:liuid' => 'studentexpos#show', as: :show_studentexpo

    # resources :companies, only: [:index, :show]
    get '/companies' => 'companies#index', as: :companies
    get '/companies/:slug' => 'companies#show', as: :company
    get '/companies/:slug/edit/:identifier' => 'companies#edit', as: :company_edit
    put '/companies/:slug/edit/:identifier' => 'companies#update', as: :company_update

    get '/lectures' => 'lectures#index', as: :lectures
    get '/lectures/:slug' => 'lectures#show', as: :lecture

    get '/host' => 'static_pages#show', :page => 'host', as: :host
    resources :hosts, only: [:new, :create], path: 'host', path_names: {new: 'apply'}
    get '/host/:id/:liuid' => 'hosts#show', as: :show_host

    get '/photos' => 'photo_albums#index'

    # in order to have translated routes, these are needed
    get '/sponsorship' => 'static_pages#show', :page => 'sponsor/sponsor'
    get '/sponsorship/compare' => 'static_pages#show', :page => 'sponsor/compare'
    get '/sponsorship/compare/bronze' => 'static_pages#show', :page => 'sponsor/bronze', as: :sponsorship_bronze
    get '/sponsorship/compare/silver' => 'static_pages#show', :page => 'sponsor/silver', as: :sponsorship_silver
    get '/sponsorship/compare/gold' => 'static_pages#show', :page => 'sponsor/gold', as: :sponsorship_gold

    get '/banquet' => 'static_pages#show', :page => 'banquet'
    get '/about' => 'static_pages#show', :page => 'about/about'
    get '/about/contact' => 'static_pages#show', :page => 'about/contact'
    get '/about/previous-years' => 'static_pages#show', :page => 'about/previous', :as => :about_previous
  end

  root to: 'static_pages#home'
end
