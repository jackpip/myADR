class Cue < ApplicationRecord
  belongs_to :character
  belongs_to :episode

  validates :start_time, presence: true
  validates :dialogue, presence: true

end
