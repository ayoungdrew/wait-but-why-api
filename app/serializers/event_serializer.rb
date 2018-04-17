class EventSerializer < ActiveModel::Serializer
  attributes :editable, :id, :title, :date, :reason, :description, :user_id, :comments
  has_one :user
  def editable
    scope == object.user
  end
end
