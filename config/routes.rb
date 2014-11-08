Rails.application.routes.draw do
  
  root 'application#home'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do

      resources :stars
      
    end  
  end
end
