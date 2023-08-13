module Chapters
  module CharacterRecognition
    class FirstMeet < MainStory
      include Illustrations::CharacterBehaviour
      include Illustrations::CachingBehaviour

      attr_accessor :user

      def call
        recognize_hero
      end

      whispers

      def recognize_hero
        self.user = user_model.find_by(id: params[:user_id])

        if user.present?
          check_password!
          save_session

          self.consequences = { session_id: session_id }
        else
          howl_in_the_distance(user_not_found: "User #{params[:user_id]} not found")
        end

        self
      end

      def check_password!
        enchanted_data = Illustrations::WordMetamorphosis.new(mystic_dust: user.salt).call(params[:password])

        unless enchanted_data[:encrypted_password] == user.encrypted_password
          wolves!(self, wrong_password: "For user: #{user.id}, class:#{user.class}")
        end
      end

      def save_session
        redis.set(session_id, redis_data, expire: 1.day)
      end

      def redis_data
        {
          user_id: user.id,
          user_model: user.class.name,
          last_seen: Time.current
        }
      end

      def session_id
        @session_id ||= SecureRandom.uuid
      end
    end
  end
end
