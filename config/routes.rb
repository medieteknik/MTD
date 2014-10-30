Rails.application.routes.draw do
  localized do
    get '/' => 'static_pages#home'
  end
end
