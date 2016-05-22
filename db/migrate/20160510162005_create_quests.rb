class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :title
      t.text :content
      t.integer :exp

      t.timestamps null: false
    end
  end
end
