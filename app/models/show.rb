class Show < ApplicationRecord
  has_many :episodes
  has_many :characters
  has_many :users
end
