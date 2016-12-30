class Show < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_and_belongs_to_many :users

  validates :name, presence: true

end
