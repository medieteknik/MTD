Rails.application.routes.draw do
  localized do
    devise_for :admins, :path => 'admin/user'
    get '/' => 'static_pages#home', :as => :home
  end

  root to: 'static_pages#home'
end
