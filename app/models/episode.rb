class Episode < ApplicationRecord
  belongs_to :show
  has_many :characters
  has_many :cues
end
