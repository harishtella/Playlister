require 'uri'

class Mp3 < ActiveRecord::Base

  has_many :ratings

  validates_presence_of :url, :title 
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  def current_rating 
    r = self.ratings

    unless r.empty?
      r.map! {|x| x.value}
      avg = r.inject{ |sum, x| sum + x }.to_f / r.size 
      return avg.to_int
    else 
      return nil  
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
