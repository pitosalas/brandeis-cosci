class AddressBook < ActiveRecord::Base
  has_many :cards
end
