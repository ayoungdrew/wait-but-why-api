class CommentSerializer < ActiveModel::Serializer
  attributes :commenter, :commenter_image, :editable, :id, :body, :user_id, :created_at
  # has_one :event
  # has_one :user
  def editable
    scope == object.user
  end
  def commenter
    object.user.email
  end
  def commenter_image
    object.user.image
  end
end
