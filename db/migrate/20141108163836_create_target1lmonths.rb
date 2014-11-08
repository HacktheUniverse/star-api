class CreateTarget1lmonths < ActiveRecord::Migration
  def change
    create_table :target1lmonths do |t|
    	t.float :x
    	t.float :y
    	t.float :z
      t.timestamps
      
    end
  end
end
