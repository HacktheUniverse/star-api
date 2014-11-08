class CreateExplTable < ActiveRecord::Migration
  def change
    create_table :expl do |t|
      t.string :label
      t.float :x
      t.float :y
      t.float :z
      t.integer :numplanets
      t.float :distance 
      t.integer :texture 
      t.timestamps  
    end
  end
end