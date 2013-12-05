class CreatePerson < ActiveRecord::Migration
  def change
    create_table :person do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
