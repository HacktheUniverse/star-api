class CreateConstellationStarUnion < ActiveRecord::Migration
  def change
    create_table :constellation_star_unions do |t|
      t.integer :star_id
      t.integer :constellation_id
    end
        
    add_index :constellation_star_unions, :star_id
    add_index :constellation_star_unions, :constellation_id
    
    remove_column :stars, :constellation_id
  end
end
