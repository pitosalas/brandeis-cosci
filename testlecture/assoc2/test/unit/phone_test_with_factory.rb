require 'test_helper'

class PhoneTest < ActiveSupport::TestCase

  # Replace this with your real tests.
  test "Test truth" do
    assert true
  end
  
  test "Allow valid area code" do
    valid_num = Factory.build(:phone, :number => "617-666-1234")
    assert valid_num.valid?
  end
  
  test "And try another valid area code" do
    valid_num = Factory.build(:phone, :number => "781-666-1234")
    assert valid_num.valid?
  end
  
  test "An invalid area code should be rejected" do
    invalid_num = Factory.build(:phone, :number => "000-666-1234")
    assert !valid_num.valid?

  end
end
