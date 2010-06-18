require 'test/unit'

# Design a class to represent a dictionary
class Dictionary
  
# We know that the dictionary starts out empty
  def initialize
    @empty = true
  end

# Don't know yet how I will represent info
  def empty?
    @empty
  end
  
  def add_translation(english, otherlanguage)
    @empty = false
  end

end

# Test the class as we develop it
class DictionaryTest < Test::Unit::TestCase

# Check that a new dictionary is empty
  def test_empty_dict
    d = Dictionary.new
    assert d.empty?
  end

# Check that once you add at least one translation it is not empty  
  def test_adding_xlate
    d = Dictionary.new
    d.add_translation("book", "boek")
    assert !d.empty?
  end
  
# Check that I can fetch the translation I added.
  def test_add_fetch_xlate
    d = Dictionary.new
    d.add_translation("book", "boek")
    book = d.translate("boek")
    assert_equal "book", "expected translation to be book"
  end
  
end
