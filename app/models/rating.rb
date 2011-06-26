class Rating < ActiveRecord::Base
  belongs_to :mp3
  # TODO: validate rating value
end
