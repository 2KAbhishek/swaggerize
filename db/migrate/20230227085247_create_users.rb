# frozen_string_literal: true

# Add users table
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :avatar
      t.string :bio

      t.timestamps
    end
  end
end
