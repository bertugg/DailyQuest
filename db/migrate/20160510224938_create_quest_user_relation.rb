class CreateQuestUserRelation < ActiveRecord::Migration
  def change

    create_table :userquests, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :quests, index: true
      t.datetime :expiredate, :null => false, :default => DateTime.tomorrow
      t.boolean :isdone, :default => false
    end
  end
end
