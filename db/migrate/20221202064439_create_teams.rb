class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :owner_id

      t.timestamps
    end
  end
end
