class Track < ActiveRecord::Base
  
  def to_s
    "Track: #{title}"
  end
end
