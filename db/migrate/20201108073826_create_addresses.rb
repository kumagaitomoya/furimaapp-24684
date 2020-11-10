class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,             null: false
      t.string     :municipality,            null: false
      t.string     :address,                 null: false
      t.string     :buiding_name            
      t.string     :phone_namber,            null: false
      t.integer    :shipping_area_id,        null: false
      t.references :buyer, foreign_key: true
      t.timestamps
    end
  end
end




