require 'pp'

def comment?(line)
  line.start_with? "#"
end

def metadata?(line)
  ["datavar"].include? line.split(" ").first
end

def get_metadata_value(line)
  [line.split(" ")[0], line.split(" ")[2]]
end

namespace :parser do 

	namespace :milkyway do 
		desc "parser for open clusters"
		task oc: :environment do 
			spec_file = Rails.root.join "data", "milkyway", "specks", "oc.speck"

      comments = []
      metadata = {
        columns: ["label", "x", "y", "z"]
      }
      open_clusters = []

       IO::readlines(spec_file).each do |line|
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
          oc = {}
          tokens = line.split("#")
          unless tokens[1].nil?
            oc[:label] = tokens[1].chomp.strip
            oc_tokens = tokens[0].split(" ")
            oc_tokens.each_with_index do |token, index|
              #TODO: make this float and int if its a number
              oc[metadata[:columns][index.to_i]] = token 
            end
          end
          open_clusters.push(oc)
        end
       end
       pp open_clusters
    end
  end
end