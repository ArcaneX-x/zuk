module Chapters
  module CharacterUnveiling
    class FirstMeet < MainStory
      include Illustrations::CharacterBehaviour

      def call
        user = user_model.new(email: params[:email], password: params[:password])

        if user.save
          self.consequences = { user: user }
        else
          howl_in_the_distance(user_not_saved: user.errors.full_messages)
        end

        self
      end
    end
  end
end
