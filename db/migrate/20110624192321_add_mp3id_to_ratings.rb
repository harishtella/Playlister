class AddMp3idToRatings < ActiveRecord::Migration
  def self.up
    add_column :ratings, :mp3_id, :integer
  end

  def self.down
    remove_column :ratings, :mp3_id
  end
end
