class TrackingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :info_type, :start_time, :end_time, :amount, :amount_unit, :note, :bebe_id, :day_id
  belongs_to :day
end
