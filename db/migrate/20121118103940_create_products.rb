class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.string :product_name, :null => false
	  t.string :product_id, :null => false
	  t.text :pic
	  t.string :price
	  t.string :spec
	  t.text :cert
	  t.text :desc
	  t.text :adv
	  t.string :comp
	  t.string :usage
	  t.string :orig

      t.timestamps
    end

	add_index :products, :product_id

  end
end
