class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :description
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
