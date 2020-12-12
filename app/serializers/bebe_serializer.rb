class BebeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :birthdate, :kind, :bio
  belongs_to :user
end
