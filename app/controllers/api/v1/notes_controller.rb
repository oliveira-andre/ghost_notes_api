# frozen_string_literal: true

module Api
  module V1
    class NotesController < ApplicationController
      def create
        serializer(NotesValidator::Create.new(create_note_params).execute)
      end

      def destroy
        serializer(NotesValidator::Destroy.new(slug: params[:slug]).execute)
      end

      def show
        serializer(
          NotesValidator::Show.new(
            slug: params[:slug], password: params[:password]
          ).execute
        )
      end

      private

      def create_note_params
        params.require(:notes).permit(:title, :body, :password, :keys)
      end
    end
  end
end
