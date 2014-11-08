require 'pp'
namespace :parser  do
  def galaxy?(line)

    # binding.pry
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

      IO::readlines(spec_file).each do |line|

        if unneeded_data?(line) || if_empty(line)
          # binding.pry
        elsif galaxy?(line)

          # galaxies[get_galaxy(line)] ||= Hash.new { [] }
          # galaxies[get_galaxy(line)][get_const_arm(line)] = Array.new 
          if galaxies[get_galaxy(line)]
            
          end
          constellation = { get_const_arm(line) => [] }
          galaxies[get_galaxy(line)] = constellation
          # galaxies[get_galaxy(line)][get_const_arm(line)] = "abc"
          last = galaxies[get_galaxy(line)][get_const_arm(line)]
          # binding.pry
        else   
          last = []       
          star_name = line.split("#")[1].split(",")[0].split(" ")[0]
          # binding.pry  
          last.push(star_name)
        
        end
      end
      pp galaxies
    end
  end
end