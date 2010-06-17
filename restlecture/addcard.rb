require 'rubygems'
require 'httparty'

class CardUtil
  include HTTParty
  base_uri 'localhost:3000'
  
  def update_card(cardnum, text)
    options = {:query => {:card => {:name => text, :home_phone => "1234"}}}
    self.class.get("/cards/#{cardnum}/store.xml", options)
  end
end


cu = CardUtil.new
cu.update_card(ARGV[0], ARGV[1])
