require 'pp'
namespace :parser  do
  def galaxy?(line)
    line.start_with? "#" && line.split(":")[0].split(" ")[1] == 3
  end

  def get_galaxy(line)
    line.split(":")[0].split(" ")[1]
  end

  def get_const_arm(line)
    line.split(":")[1].split(" ").join(" ")
  end

  def metadata?(line)
    ["datavar", "texture", "texturevar"].include? line.split(" ").first
  end

  def get_metadata_value(line)
    [line.split(" ")[0], line.split(" ")[2]]
  end

  namespace :milkyway do
    desc "Parser for stars.speck"
    task constellations: :environment do
      spec_file = Rails.root.join "data", "milkyway", "specks", "constellations.speck"
      label_file = Rails.root.join "data", "milkyway", "specks", "constellations.label"

      comments = []
      metadata = {
        columns: ["label", "x", "y", "z"]
      }
      galaxy = Hash.new { {} }


      IO::readlines(spec_file).each do |line|
        if galaxy?(line)
          get_const_arm = #####
          galaxy[get_galaxy(line)] = {get_const_arm}
        elsif metadata?(line)
          key, value = get_metadata_value(line)
          if key == "datavar"
            metadata[:columns].push(value)
          else
            metadata[key] = value
          end
        else
          constellation = {}
          tokens = line.split("#")
          unless tokens[1].nil?
            constellation[:label] = tokens[1].chomp.strip
            constellation_tokens = tokens[0].split(" ")
            constellation_tokens.each_with_index do |token, index|
              #TODO: make this float and int if its a number
              constellation[metadata[:columns][index.to_i + 1]] = token 
            end
          end
          galaxy.push(constellation)
        end
      end
      pp stars
    end
  end
end