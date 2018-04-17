class EventSerializer < ActiveModel::Serializer
  attributes :author, :editable, :id, :title, :date, :reason, :description, :user_id, :comments
  # has_one :user
  # has_many :comments
  def author
    object.user.email
    # object.comments.pluck(:user_id)
  end

  def comments
    object.comments.pluck(:id)
    # object.comments.pluck(:user_id)
  end

  # def commenters
  #   object.comments.user.email
  # end

  def editable
    scope == object.user
  end

end
