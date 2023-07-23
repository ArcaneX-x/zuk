module Chapters
  module CharacterRecognition
    class LaterMeet < MainStory
      attr_accessor :user

      def call
        recognize_hero
      end

      whispers

      def recognize_hero
        user = user_model.find_by(id: params[:user_id])

        if user.present?
          self.consequences = session_data
        else
          howl_in_the_distance(user_not_found: "User #{params[:user_id]} not found")
        end
      end

      def session_data
        {
          user_id: user.id,
          user_model: user.class.name
        }
      end

      def user_model
        params[:user_model].constantize rescue NameError
      end
    end
  end
end
