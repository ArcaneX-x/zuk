module Chapters
  module CharacterRecognition
    class FirstMeet < MainStory

      def call
        session[:user_id]
      end

      whispers

      def recognize_hero

      end

      def session_data
        {
          user_id:
        }
      end

      def user_model
        params[:user_model].constantize rescue NameError
      end
    end
  end
end
