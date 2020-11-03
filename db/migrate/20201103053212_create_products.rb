class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,                  null: false
      t.text    :status,                null: false
      t.integer :price,                 null: false
      t.integer :category_id,           null: false
      t.integer :shipping_charges_id,   null: false
      t.integer :shipping_days_id,      null: false
      t.integer :shipping_area_id,      null: false
      t.integer :condition_id,          null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end



# | Column              | Type       | Options                       |
# | ----------------    | ---------- | ----------------------------- |
# | user                | references | null: false,foreign_key: true |
# | name                | string     | null: false                   |
# | status              | text       | null: false                   |
# | price               | integer    | null: false                   |
# | category_id         | integer    | null: false                   |
# | shipping_charges_id | integer    | null: false                   |
# | shipping_days_id    | integer    | null: false                   |
# | shipping_area_id    | integer    | null: false                   |
# | condition_id        | integer    | null: false                   |