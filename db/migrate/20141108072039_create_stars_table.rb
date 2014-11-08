class CreateStarsTable < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :label
      t.float :x
      t.float :y
      t.float :z
      t.float :colorb_v
      t.float :absmag
      t.float :appmag
      t.float :texnum
      t.float :distly
      t.float :dcalc
      t.float :plx
      t.float :plxerr
      t.float :vx
      t.float :vy
      t.float :vz
      t.float :speed
      t.float :hipnum
      t.timestamps
    end
  end
end
