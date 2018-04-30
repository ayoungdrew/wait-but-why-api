# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :following, :followers, :active_relationships
end
