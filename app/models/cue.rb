class Cue < ApplicationRecord
  has_one :character
  belongs_to :episode
end
