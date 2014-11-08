class AltertableExoplanets < ActiveRecord::Migration
  def change
    rename_table :expl, :exo_planets
  end
end
