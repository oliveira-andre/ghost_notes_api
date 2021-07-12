# frozen_string_literal: true

module Api
  module V1
    module NotesValidator
      class Create
        def initialize(params = {})
          @title = params[:title]
          @body = params[:body]
          @password = params[:password]
          @keys = params[:keys] || []
        end

        def execute
          validate
          create

          { data: @note, serializer: NotesSerializer, status: :ok }
        end

        private

        def validate
          @note = Note.new(
            title: @title, body: @body, password: @password
          )
          @note.keys << @keys
          debugger
          return if @note.valid?

          raise ServiceException.new, ''
        end

        def create
          return if @note.save

          raise ServiceException.new, ''
        end
      end
    end
  end
end
