# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_many :posts
end
