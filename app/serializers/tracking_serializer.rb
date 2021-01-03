class TrackingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :info_type, :start_time, :end_time, :amount, :amount_unit, :note, :day_id
  belongs_to :day, serializer: DaySerializer
end
