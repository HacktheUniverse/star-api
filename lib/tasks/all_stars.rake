namespace :cache  do
  desc "Cache all stars in a collection"
  task stars: :environment do
    all_stars_json = Star.all.to_json
    File.write(Rails.root.join('app', 'assets', 'data', 'all_stars.json'), all_stars_json)
  end
end
