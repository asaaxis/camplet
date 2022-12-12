class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :travel_plan, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
