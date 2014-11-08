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

  namespace :milkyway do
    desc "Parser for stars.speck"
    task stars: :environment do
      Rake.application.invoke_task("parser:milkyway:generic[stars.speck, Star]")
    end

    desc "Parser for oc.speck"
    task oc: :environment do
      Rake.application.invoke_task("parser:milkyway:generic[oc.speck, OpenCluster]")
    end

    desc "Parser for expl.speck"
    task expl: :environment do
      Rake.application.invoke_task("parser:milkyway:generic[expl.speck, ExoPlanet]")
    end

    desc "Parser for localgroup.speck"
    task localgroup: :environment do
      Rake.application.invoke_task("parser:milkyway:generic[localgroup.speck, LocalGroup]")
    end

  namespace :extragalactic do 
    desc "Parser for sdssgals.speck"
    task sdssgals: :environment do 

      spec_file = 
      IO::readlines(spec_file).each_slice(1000) do |lines|
        items = []
        lines.each do |line|
          if line.empty?
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
            tokens = line.split("#")
            item = {}
            if tokens[1].present?
              item[:label] = tokens[1].chomp.strip
              item_tokens = tokens[0].split(" ")
              item_tokens.each_with_index do |token, index|
              
                item[metadata[:columns][index.to_i + 1]] = token
              end
              items.push item
            end
          end
        end
        args.model_class.constantize.create! items
      end





    end



  end

    desc "Generic Parser for speck files"
    task :generic, [:file_name, :model_class] => :environment  do |task, args|
      spec_uri = "/users/abbott/dudata/milkyway/specks/#{args.file_name}"
      spec_file = Tempfile.new('speck')
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

      IO::readlines(spec_file).each_slice(1000) do |lines|
        items = []
        lines.each do |line|
          if line.empty?
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
              item_tokens.each_with_index do |token, index|
                item[metadata[:columns][index.to_i]] = token
              end
              items.push item
            end
          end
        end
        args.model_class.constantize.create! items
      end
    end
  end
end