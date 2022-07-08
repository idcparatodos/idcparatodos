class CreateRedes < ActiveRecord::Migration[7.0]
  def change
    create_table :redes do |t|
      t.string :nome
      t.string :token

      t.index :nome, unique: true
      t.index :token, unique: true
      t.timestamps
    end
  end
end
