class Day < ApplicationRecord
  belongs_to :bebe
  validates :date, presence: true
  validates :date, uniqueness: { scope: :bebe_id,
    message: "track data daily per bebe" }
end
