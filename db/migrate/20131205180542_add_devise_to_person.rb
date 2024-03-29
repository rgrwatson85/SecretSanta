class AddDeviseToPerson < ActiveRecord::Migration
  def self.up
    change_table(:people) do |t|
      ## Database authenticatable
      t.string :email,              :null => true, :default => ''
      t.string :encrypted_password, :null => false, :default => ''
    end
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
