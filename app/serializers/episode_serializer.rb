class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :why, :description, :user_id
  has_one :user
end
