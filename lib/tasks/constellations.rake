require 'pp'
namespace :parser  do
  def galaxy?(line)
    line.split(":")[0].split(" ")[1].length == 3
  end

  def get_galaxy(line)
    line.split(":")[0].split(" ")[1]
  end

  def unneeded_data?(line)
    (line.include? "{") || (line.include? "}") || (line.split(" ").length == 2)
  end

  def get_const_arm(line)
    line.split(":")[1].split(" ").join(" ")
  end

  def if_empty(line)
    line.start_with?("\n")
  end


  namespace :milkyway do
    desc "Parser for stars.speck"
    task constellations: :environment do
      spec_file = Rails.root.join "data", "milkyway", "specks", "constellations.speck"
      label_file = Rails.root.join "data", "milkyway", "specks", "constellations.label"

      galaxies = Hash.new { Hash.new { Array.new } }

      last = nil
      IO::readlines(spec_file).each do |line|                
        if unneeded_data?(line) || if_empty(line)
        elsif galaxy?(line)
          if galaxies[get_galaxy(line)].keys.length > 0
            galaxies[get_galaxy(line)][get_const_arm(line)] = []
            last = galaxies[get_galaxy(line)][get_const_arm(line)]
          else 
            constellation = { get_const_arm(line) => [] }    
            galaxies[get_galaxy(line)] = constellation
            last = galaxies[get_galaxy(line)][get_const_arm(line)]
          end
        else   
          if last            
            star_name = line.split("#")[1].split(",")[0].split(" ")[0]
          end
          last.push(star_name)
        
        end
      end
      pp galaxies
    end
  end
end