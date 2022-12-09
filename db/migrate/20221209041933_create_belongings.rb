class CreateBelongings < ActiveRecord::Migration[6.1]
  def change
    create_table :belongings do |t|
      t.references :travel_plan, null: false, foreign_key: true
      t.references :gear, null: false, foreign_key: true

      t.timestamps
    end
  end
end
