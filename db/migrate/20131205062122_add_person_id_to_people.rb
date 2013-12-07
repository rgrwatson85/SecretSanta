class AddPersonIdToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :person_id, index: true
  end
end
