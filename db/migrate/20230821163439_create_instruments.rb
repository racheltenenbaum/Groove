class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.date :available_from
      t.text :description
      t.string :brand
      t.integer :price
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
