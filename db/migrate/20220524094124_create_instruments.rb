class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :type
      t.string :model
      t.text :description
      t.float :price_per_day
      t.string :location
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
