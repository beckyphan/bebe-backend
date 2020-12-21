class Bebe < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  validates :name, presence: true
  validates :birthdate, presence: true
  validates :kind, inclusion: { in: %w(human plant pet),
    message: "%{value} is not a valid kind" }
end
