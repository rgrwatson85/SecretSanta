class AddIsSelectedToPerson < ActiveRecord::Migration
  def change
    add_column :people, :is_selected, :boolean
  end
end
