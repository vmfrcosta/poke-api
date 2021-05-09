class AddSourceToAbility < ActiveRecord::Migration[6.1]
  def change
    add_column :abilities, :source, :string
  end
end
