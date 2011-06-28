class Rating < ActiveRecord::Base
  belongs_to :mp3
  validates_presence_of :mp3_id
  validates_numericality_of :value, :only_integer => true
end
