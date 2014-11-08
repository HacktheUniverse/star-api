class AddQuasar < ActiveRecord::Migration
  def change

  	create_table :quasars do |t|
  		t.float :x
  		t.float :y
  		t.float :z
  		t.float :Rmag
  		t.float :redshift
  		t.float :Tlookback
  		t.float :distMpc
  		t.float :distMly
  		t.float :radeg
  		t.float :decdeg
  		t.integer :release
  	end
  end
end
