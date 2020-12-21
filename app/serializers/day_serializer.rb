class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :picture, :date, :note, :bebe_id
  belongs_to :bebe, serializer: BebeSerializer
end
