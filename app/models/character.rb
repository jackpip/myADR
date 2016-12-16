class Character < ApplicationRecord
  has_many :cues
  has_many :episodes
  belongs_to :show
end
