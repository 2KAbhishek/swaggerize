# frozen_string_literal: true

# Post Model
class Post < ApplicationRecord
  belongs_to :user
end
