class Card < ActiveRecord::Base
  belongs_to :office_phone, :class_name => 'Phone'
  belongs_to :home_phone, :class_name => 'Phone'
  
end
