Rails.application.routes.draw do
  localized do
    devise_for :admins, :path => 'admin/user'
    get '/' => 'static_pages#show', :as => :home, :page => 'home'

    # in order to have translated routes, these are needed
    get '/sponsorship' => 'static_pages#show', :page => 'sponsorship'
    # get '/sponsorship/gold' => 'static_pages#show', :page => 'sponsorship/gold'
    # get '/sponsorship/silver' => 'static_pages#show', :page => 'sponsorship/silver'
    # get '/sponsorship/bronze' => 'static_pages#show', :page => 'sponsorship/bronze'
    get '/about' => 'static_pages#show', :page => 'about'

    get '*page', to: 'static_pages#show'
  end

  root to: 'static_pages#show', :page => 'home'
end
