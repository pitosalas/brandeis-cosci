class AddAddressBookIdToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :addressbook_id, :integer
  end

  def self.down
    remove_column :cards, :addressbook_id
  end
end
