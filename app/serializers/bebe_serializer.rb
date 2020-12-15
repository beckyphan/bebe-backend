class BebeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :birthdate, :kind, :bio, :img
  belongs_to :user, serializer: UserSerializer
end
