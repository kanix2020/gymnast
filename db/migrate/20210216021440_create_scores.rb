class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.float :floor_d,         null: false
      t.float :floor_e,         null: false
      t.float :floor_nd,        null: false
      t.float :pommel_d,        null: false
      t.float :pommel_e,        null: false
      t.float :pommel_nd,       null: false
      t.float :rings_d,         null: false
      t.float :rings_e,         null: false
      t.float :rings_nd,        null: false
      t.float :vault_d,         null: false
      t.float :vault_e,         null: false
      t.float :vault_nd,        null: false
      t.float :parallel_d,      null: false
      t.float :parallel_e,      null: false
      t.float :parallel_nd,     null: false
      t.float :horizontal_d,    null: false
      t.float :horizontal_e,    null: false
      t.float :horizontal_nd,   null: false 
      t.references :athlete,    foreign_key: true
      t.references :game,       foreign_key: true
      t.timestamps
    end
  end
end
