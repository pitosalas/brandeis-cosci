require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  
  # Note: this case is not working yet. Need to figure out the problem!
  test "setting the home_phone works" do
    a_phone = mock()
    a_card = Card.new(:name => "Joe Winston")
    a_card.home_phone = a_phone
    assert_equal a_phone, a_card.home_phone
 end

end

