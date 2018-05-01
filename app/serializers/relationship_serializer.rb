class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :follower_id, :followed_id, :follower, :followed
  def follower
    object.follower.email
  end

  def followed
    object.followed.email
  end

end
