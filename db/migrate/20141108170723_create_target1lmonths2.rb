class CreateTarget1lmonths2 < ActiveRecord::Migration
  def change
  	drop_table :target1lmonths
    create_table :target1lmonths do |t|
    	t.float :x
    	t.float :y
    	t.float :z

    	t.timestamps
    end
  end
end
