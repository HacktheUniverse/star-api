class CreateGalGrids < ActiveRecord::Migration
  def change
    create_table :gal_grids do |t|
    	t.float :x
    	t.float :y
    	t.float :z

      t.timestamps
    end
  end
end
