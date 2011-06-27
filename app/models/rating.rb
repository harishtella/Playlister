class Rating < ActiveRecord::Base
  belongs_to :mp3
  validates_numericality_of :value
end
