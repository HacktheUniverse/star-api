require 'pp'
require 'byebug'
require 'net/http'

namespace :parser do

  def comment?(line)
    line.start_with? "#"
  end

  def metadata?(line)
    ["datavar", "texture", "texturevar"].include? line.split(" ").first
  end

  def get_metadata_value(line)
    [line.split(" ")[0], line.split(" ")[2]]
  end


	namespace :extragalactic do 
		task sdssgals: :environment do 
			spec_uri = "/users/abbott/dudata/extragalactic/specks/sdssgals.speck"
	      	label_uri = "/users/abbott/dudata/extragalactic/specks/sdssgals.label"
			spec_file = Tempfile.new('speck')
			label_file = Tempfile.new('label')
			Net::HTTP.start("research.amnh.org") do |http|
	        	resp = http.get(spec_uri)
	        	open(spec_file, "wb") do |file|
	          	file.write(resp.body)
	        	end
	      	end

			comments = []
  			metadata = {
    			columns: ["x", "y", "z"]
  			}

	      	IO::readlines(spec_file)[0..1000].each_slice(1000) do |lines|
	      		
	      		items = []
	      		lines.each do |line|
		      		if line.empty? || line.strip.empty?
		      			next
		      		elsif comment?(line)
		      			comments.push(line)
		      		elsif metadata?(line)		
		      			key, value = get_metadata_value(line)
		      			if key == "datavar"
			              metadata[:columns].push(value)
			            else
			              metadata[key] = value
			          	end
			        else
			          item = {}
		              item_tokens = line.split(" ")	
		              next if item_tokens.empty?
		              item_tokens.each_with_index do |token, index|
		                item[metadata[:columns][index.to_i]] = token
		              end
		              items.push item	
		              # binding.pry
		              # pp item
		          	end		          	
	      		end
		              Quasar.create! items
		    end
		end
	end
end


