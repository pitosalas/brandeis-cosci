require 'test/unit'

# Design a class to represent a dictionary
class Dictionary
end

# Test the class as we develop it
class DictionaryTest < Test::Unit::TestCase

  def test_empty_dict
    d = Dictionary.new
    assert d.is_empty?
  end
  
  def test_add_translation
    d = Dictionary.new
    d.add_translation("book", "boek")
    book = d.translate("boek")
    assert_equal "book", "expected translation to be book"
  end
  
end
