class Day < ApplicationRecord
  belongs_to :bebe
  validates :date, presence: true
  validates :date, uniqueness: { scope: :bebe_id,
    message: "Date already exists for this bebe." }

  has_many :trackings, dependent: :destroy
end
