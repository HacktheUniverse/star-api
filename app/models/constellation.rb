class Constellation < ActiveRecord::Base
  include Searchable
  has_many :stars
end