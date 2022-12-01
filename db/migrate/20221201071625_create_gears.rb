class CreateGears < ActiveRecord::Migration[6.1]
  def change
    create_table :gears do |t|
      t.string :name, null: false
      t.text :description
      t.integer :quantity, default: 0
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
