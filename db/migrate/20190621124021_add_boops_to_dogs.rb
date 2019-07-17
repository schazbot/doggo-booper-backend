class AddBoopsToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :boops, :integer,  default: 0
  end
end
