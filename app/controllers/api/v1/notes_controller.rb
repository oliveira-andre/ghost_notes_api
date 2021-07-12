# frozen_string_literal: true

module Api
  module V1
    class NotesController < ApplicationController
      def create
        serializer(NotesValidator::Create.new(create_note_params).execute)
      end

      def destroy; end

      private

      def create_note_params
        params.require(:notes).permit(:title, :body, :password, :keys)
      end
    end
  end
end
