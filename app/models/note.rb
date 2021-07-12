# frozen_string_literal: true

class Note < ApplicationRecord
  include BCrypt
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates_presence_of :body, :title, :keys, :slug
  validates_uniqueness_of :slug

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def valid_password?(password)
    Password.new(encrypted_password) == password
  end

  def add_key(key)
    return unless key&.present?

    keys << key
    update(keys: keys)
  end
end
