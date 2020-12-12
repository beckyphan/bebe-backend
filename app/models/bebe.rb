class Bebe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :birthdate, prescence: true
  validates :kind, inclusion: { in: %w(human plant pet),
    message: "%{value} is not a valid kind" }
end
