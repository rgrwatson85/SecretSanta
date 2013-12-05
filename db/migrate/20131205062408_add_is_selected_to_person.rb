class AddIsSelectedToPerson < ActiveRecord::Migration
  def change
    add_column :person, :is_selected, :boolean
  end
end
