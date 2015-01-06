Rails.application.routes.draw do
  
  root 'application#home'

  namespace :api, :defaults => {:format => :json} do
    #the original api as developed during the hackathon - all resources
    #handled and returned by a single controller
    namespace :v1 do
      get 'search' => 'resources#search'
      get ':resource/:id' => 'resources#show'
      get ':resource' => 'resources#index'
    end

    #new version wherein all resources have associated routes and controllers
    #as well as new functionality.
    namespace :v2 do
      get 'stars' => 'stars#index', as: 'stars'
      get 'stars/:label' => 'stars#show', as: 'star'

      get 'constellations' => 'constellations#index', as: 'constellations'
      get 'constellations/:name' => 'constellations#show', as: 'constellation'

      get 'exoplanets' => 'exoplanets#index', as: 'exoplanets'
      get 'exoplanets/:name' => 'exoplanets#show', as: 'exoplanet'
      

    end

    
  end
end
