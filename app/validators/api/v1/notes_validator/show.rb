# frozen_string_literal: true

module Api
  module V1
    module NotesValidator
      class Show
        def initialize(params = {})
          @slug = params[:slug]
          @password = params[:password]
        end

        def execute
          find
          check_password

          { data: @note, serializer: NotesSerializer, status: :ok }
        end

        private

        def find
          @note = Note.find_by(slug: @slug)
          return if @note

          raise ServiceExceptino.new, ''
        end

        def check_password
          return if !@note.password || (@password && @note.valid_password?(@password))

          raise ServiceException.new, ''
        end
      end
    end
  end
end
