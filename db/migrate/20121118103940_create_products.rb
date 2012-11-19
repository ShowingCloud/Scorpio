class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.string :product_name, :null => false
	  t.string :product_id, :null => false
	  t.string :product_pic, :null => false
	  t.text :gallery
	  t.decimal :price, :precision => 6, :scale => 2, :null => false
	  t.decimal :retail, :precision => 6, :scale => 2, :null => false
	  t.string :price_desc, :null => false
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
