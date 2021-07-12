# frozen_string_literal: true

module Api
  module V1
    module NotesValidator
      class Destroy
        def initialize(params = {})
          @slug = params[:slug]
        end

        def execute
          destroy

          { data: nil, serialzier: nil, status: :no_content }
        end

        private

        def destroy
          @note = Note.find_by(slug: @slug)
          return if @note&.destroy

          raise ServiceException.new, ''
        end
      end
    end
  end
end
