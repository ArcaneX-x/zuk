module Chapters
  module CharacterUnveiling
    class FirstMeet < MainStory

      def call
        user = user_model.new(email: params[:email], password: params[:password])

        if user.save
          self.consequences = { user: user }
        else
          howl_in_the_distance(user_not_saved: user.errors.full_messages)
        end
      end

      whispers

      def user_model
        params[:user_model].constantize rescue NameError
      end
    end
  end
end
