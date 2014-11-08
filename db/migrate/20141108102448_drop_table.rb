class DropTable < ActiveRecord::Migration
  def change
    drop_table :constellations
  end
end
