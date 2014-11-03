Rails.application.routes.draw do
  devise_for :admins, :path => 'admin'
  localized do
    get '/' => 'static_pages#home'
  end
  root to: 'static_pages#home'
end
