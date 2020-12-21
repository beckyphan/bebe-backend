class Day < ApplicationRecord
  belongs_to :bebe
  validates :date, presence: true
  validates :date, uniqueness: true
end
