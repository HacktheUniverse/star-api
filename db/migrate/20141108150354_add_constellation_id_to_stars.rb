class AddConstellationIdToStars < ActiveRecord::Migration
  def change
    add_column :stars, :constellation_id, :integer
    add_index :stars, :constellation_id
  end
end
