# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :image, :following, :followers, :active_relationships
end
