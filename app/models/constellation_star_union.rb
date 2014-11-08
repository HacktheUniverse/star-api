class ConstellationStarUnion < ActiveRecord::Base
  belongs_to :constellation
  belongs_to :star
end