namespace :search do
  task rebuild: :environment do
    [ExoPlanet, Constellation, LocalGroup, OpenCluster, Star].each(&:reset_search_index!)
  end
end