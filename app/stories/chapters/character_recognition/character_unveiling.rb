module Chapters
  module CharacterRecognition
    class CharacterUnveiling < MainStory

      def call
        user_model
      end

      whispers

      def user_model
        params[:user_model].constantize rescue NameError
      end
    end
  end
end
