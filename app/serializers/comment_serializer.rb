class CommentSerializer < ActiveModel::Serializer
  attributes :commenter, :editable, :id, :body, :user_id, :created_at
  # has_one :event
  # has_one :user
  def editable
    scope == object.user
  end
  def commenter
    object.user.email
  end
end
