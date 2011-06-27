class Mp3 < ActiveRecord::Base
  has_many :ratings
  # TODO validate url
  # TODO validate length >0
  #
  
  def current_rating 
    r = self.ratings
    r.map! {|x| x.value}

    avg = r.inject{ |sum, x| sum + x }.to_f / r.size 
    avg.to_int
  end

  def self.from_artists(artists)
    self.where("artist_name IN (?)", artists)
  end

end
