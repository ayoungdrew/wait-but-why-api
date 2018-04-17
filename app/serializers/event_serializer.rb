class EventSerializer < ActiveModel::Serializer
  attributes :editable, :id, :title, :date, :reason, :description, :user_id, :comments
  has_one :user
  has_many :comments

  def editable
    scope == object.user
  end
end
