Rails.application.routes.draw do
  
  root 'application#home'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get ':resource/:id' => 'resources#show'
      get ':resource' => 'resources#index'
      
    end
  end
end
