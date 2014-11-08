class CreateLocalGroups < ActiveRecord::Migration
  def change
    create_table :local_groups do |t|

    	t.string :label
    	t.float :x
			t.float :y
			t.float :z
			t.string :distly
      t.timestamps
    end
  end
end
