class Constellation < ActiveRecord::Base  

  has_many(
    :constellation_star_unions,
    class_name: "ConstellationStarUnion",
    foreign_key: :constellation_id,
    primary_key: :id
  )
  
  has_many :stars, through: :constellation_star_unions
end