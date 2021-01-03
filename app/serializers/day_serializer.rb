class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :picture, :date, :note, :bebe_id
  has_many :trackings, serializer: TrackingSerializer
end
