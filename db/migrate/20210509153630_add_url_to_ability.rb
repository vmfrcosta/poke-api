class AddUrlToAbility < ActiveRecord::Migration[6.1]
  def change
    add_column :abilities, :url, :string
  end
end
