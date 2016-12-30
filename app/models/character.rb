class Character < ApplicationRecord
  has_many :cues, dependent: :destroy
  has_many :episodes
  belongs_to :show

  validates :name, presence: true
  validates :actor, presence: true
  validates :abbr, presence: true
  validates :abbr, uniqueness: true

end
