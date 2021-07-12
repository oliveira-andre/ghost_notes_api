# frozen_string_literal: true

module Api
  module V1
    class NotesSerializer < ApplicationSerializer
      def serialize
        return attributes(data) unless data.respond_to?('map')

        data.map { |data| attributes(data) }.compact
      end

      def attributes(data)
        {
          title: data.title,
          body: data.body,
          password: data&.encrypted_password,
          public_keys: data&.keys,
          slug: data.slug
        }
      end
    end
  end
end
