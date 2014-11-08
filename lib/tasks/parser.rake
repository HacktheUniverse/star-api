require 'pp'
namespace :parser  do
  def comment?(line)
    line.start_with? "#"
  end

  def metadata?(line)
    ["datavar", "texture", "texturevar"].include? line.split(" ").first
  end

  def get_metadata_value(line)
    [line.split(" ")[0], line.split(" ")[2]]
  end

  namespace :milkyway do
    desc "Parser for stars.speck"
    task stars: :environment do
      spec_file = Rails.root.join "data", "milkyway", "specks", "stars.speck"

      comments = []
      metadata = {
        columns: ["label", "x", "y", "z"]
      }
      stars = {}

      IO::readlines(spec_file).first(1000).each do |line|
        if comment?(line)
          comments.push(line)
        elsif metadata?(line)
          key, value = get_metadata_value(line)
          if key == "datavar"
            metadata[:columns].push(value)
          else
            metadata[key] = value
          end
        else
          star = {}
          tokens = line.split("#")
          star[:label] = tokens[1].chomp.strip

          star_tokens = tokens[0].split(" ")
          star_tokens.each_with_index do |token, index|
            #TODO: make this float and int if its a number
            star[metadata[:columns][index.to_i + 1]] = token
          end

          stars[star[:label]] = star
        end
      end
      Rails.cache.write(:stars, stars)
    end
  end
end