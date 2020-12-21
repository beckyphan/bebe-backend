class DaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :picture, :date, :note, :bebe_id
end
