require 'uri'

class Mp3 < ActiveRecord::Base
  has_many :ratings
  validates_presence_of :url, :title, :artist_name, :length
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_numericality_of :length, :only_integer => true

  
  def average_rating 
    rating_vals = self.ratings.map {|x| x.value}

    unless rating_vals.empty?
      average = rating_vals.inject {|sum, x| sum + x }.to_f / rating_vals.size 
      return average.round
    else 
      return nil  
    end
  end

  def average_rating_s
    if self.average_rating 
      self.average_rating.to_s
    else 
      "none yet" 
    end
  end


  def url_short
    full_url = self.url
    return URI.parse(full_url).host
  end

  def self.from_artists(artists)
    self.where("artist_name IN (?)", artists)
  end

end
