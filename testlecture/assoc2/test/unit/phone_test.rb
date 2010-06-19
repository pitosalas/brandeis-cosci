require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  fixtures :phones

  # Replace this with your real tests.
  test "Test truth" do
    assert true
  end
  
  test "Allow valid area code" do
    assert phones(:valid_area_code).valid?
  end
  
  test "And try another valid area code" do
    assert phones(:valid_area_code).valid?    
  end
end
