Rails.application.routes.draw do
  require 'constraint/domain_constraint'
  constraints Constraint::DomainConstraint.new('medieteknikdagarna.se') do
    get ':any', to: redirect(subdomain: '2014', path: '/%{any}'), any: /.*/
  end

  localized do
    devise_for :admins, :path => 'admin/user'
    get '/' => 'static_pages#show', :as => :home, :page => 'home'

    # in order to have translated routes, these are needed
    get '/sponsorship' => 'static_pages#show', :page => 'sponsor'
    # get '/sponsorship/gold' => 'static_pages#show', :page => 'sponsorship/gold'
    # get '/sponsorship/silver' => 'static_pages#show', :page => 'sponsorship/silver'
    # get '/sponsorship/bronze' => 'static_pages#show', :page => 'sponsorship/bronze'
    get '/about' => 'static_pages#show', :page => 'about/about'
    get '/about/contact' => 'static_pages#show', :page => 'about/contact'
    get '/about/previous-years' => 'static_pages#show', :page => 'about/previous', :as => :about_previous

    get '*page', to: 'static_pages#show'
  end

  root to: 'static_pages#show', :page => 'home'
end
