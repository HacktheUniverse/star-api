class CreateOpenClusters < ActiveRecord::Migration
  def change
    create_table :open_clusters do |t|
      t.string :label
      t.float :x
      t.float :y
      t.float :z
      t.float :diam
      t.float :logage
      t.float :metal
      t.float :distly
      t.timestamps
    end
  end
end
