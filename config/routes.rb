Rails.application.routes.draw do
  # require 'constraint/domain_constraint'
  # constraints Constraint::DomainConstraint.new('medieteknikdagarna.se') do
  #   get ':any', to: redirect(subdomain: '2014', path: '/%{any}'), any: /.*/
  # end

  localized do
    as :user do
      patch 'admin/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
    end
    devise_for :users, :path => 'admin/user', :controllers => { :registrations => 'users/registrations',
                                                                :confirmations => 'users/confirmations' }

    get '/' => 'static_pages#show', :as => :home, :page => 'home'

    # in order to have translated routes, these are needed
    get '/sponsorship' => 'static_pages#show', :page => 'sponsor/sponsor'
    get '/sponsorship/compare' => 'static_pages#show', :page => 'sponsor/compare'
    get '/sponsorship/compare/bronze' => 'static_pages#show', :page => 'sponsor/bronze', as: :sponsorship_bronze
    get '/sponsorship/compare/silver' => 'static_pages#show', :page => 'sponsor/silver', as: :sponsorship_silver
    get '/sponsorship/compare/gold' => 'static_pages#show', :page => 'sponsor/gold', as: :sponsorship_gold

    get '/about' => 'static_pages#show', :page => 'about/about'
    get '/about/contact' => 'static_pages#show', :page => 'about/contact'
    get '/about/previous-years' => 'static_pages#show', :page => 'about/previous', :as => :about_previous

    get '*page', to: 'static_pages#show'
  end

  root to: 'static_pages#show', :page => 'home'
end
