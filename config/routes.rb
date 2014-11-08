Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json}, :path => "", :constraints => {:subdomain => "api"} do
    namespace :v1 do
      root 'welcome#index'

      resources :stars
      
    end  
  end
end
