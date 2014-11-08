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
		task :quasar :environment do 
			spec_uri = "/users/abbott/dudata/milkyway/specks/constellations.speck"
	      	label_uri = "/users/abbott/dudata/milkyway/specks/constellations.label"
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
    			columns: ["label", "x", "y", "z"]
  			}

	      	IO::readlines(spec_file).each do |line|
	      		if line.empty? 
	      			next
	      		elsif comment?

	      		elsif metadata?(line)		
	      			key, value = get_metadata_value(line)
	      				



	      	end




		end
	end
end