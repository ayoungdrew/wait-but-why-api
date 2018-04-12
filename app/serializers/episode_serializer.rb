class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :why, :description
  has_one :user
end
