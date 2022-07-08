class CreateRegistros < ActiveRecord::Migration[7.0]
  def change
    create_table :registros do |t|
      t.string :nome
      t.string :valor
      t.integer :tipo
      t.references :rede, null: false, foreign_key: true

      t.index [:nome,:rede_id], unique: true
      t.timestamps
    end
  end
end
