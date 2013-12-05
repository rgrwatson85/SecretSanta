class AddPersonIdToPerson < ActiveRecord::Migration
  def change
    add_reference :person, :person, index: true
  end
end
