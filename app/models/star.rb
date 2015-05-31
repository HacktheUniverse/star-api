class Star < ActiveRecord::Base

  has_many(
    :constellation_star_unions,
    class_name: "ConstellationStarUnion",
    foreign_key: :star_id,
    primary_key: :id
  )
  has_many :constellations, :through => :constellation_star_unions
  
end
