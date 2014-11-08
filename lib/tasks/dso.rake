require 'pp'
namespace :parser do
  def comment?(line)
    line.start_with? "#"
  end
  
  namespace :milkyway do
    desc "Parser for deep_sky_objects.speck"
    task dso: :environment do
      spec_file = Rails.root.join "data", "milkyway", "specks", "stars.speck"
      
      IO::readlines(spec_file).each do |line|
        if comment?(line)
        end
      end
    end
  end
end