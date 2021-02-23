class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string     :name,             null: false
      t.date       :event_day,        null: false
      t.string     :venue,            null: false
      t.integer    :prefecture_id,    null: false
      t.timestamps
    end
  end
end
