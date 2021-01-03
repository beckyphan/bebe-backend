class Tracking < ApplicationRecord
  belongs_to :bebe
  belongs_to :day

  validates :info_type, presence: true
  validates :amount, presence: true
  validates :amount_type, presence: true
  validates :amount_unit, presence: true

  validates :info_type, inclusion: { in: %w(food water milk pee poop exercise sleep),
    message: "%{value} is not a valid tracked data point" }
end
