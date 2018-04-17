class CommentSerializer < ActiveModel::Serializer
  attributes :editable, :id, :body, :user_id, :user, :created_at
  has_one :event
  has_one :user
  def editable
    scope == object.user
  end
end
