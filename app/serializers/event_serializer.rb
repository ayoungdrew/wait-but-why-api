class EventSerializer < ActiveModel::Serializer
  attributes :id, :why, :title, :date, :description
  has_one :user
end
