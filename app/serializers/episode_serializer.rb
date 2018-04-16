class EpisodeSerializer < ActiveModel::Serializer
  attributes :editable, :id, :title, :date, :why, :description, :user_id
  has_one :user
  def editable
    scope == object.user
  end
end
