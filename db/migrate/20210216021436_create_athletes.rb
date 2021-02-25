class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string     :name,              null: false
      t.date       :birthday,          null: false
      t.integer    :prefecture_id,     null: false
      t.integer    :affiliation_id,    null: false
      t.timestamps
    end

    add_index :athletes, :name,        unique: true
  
  end
end
