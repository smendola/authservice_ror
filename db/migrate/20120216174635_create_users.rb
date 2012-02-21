class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false

      t.timestamps
    end

    add_index :users, :username, :unique => true
  end

  def self.down
    drop_table :users
  end
end
