class Show < ApplicationRecord
  has_many :episodes
  has_many :characters
  has_and_belongs_to_many :users

  validates :name, presence: true

end
