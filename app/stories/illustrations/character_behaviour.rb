module Illustrations
  module CharacterBehaviour
    whispers

    def user_model
      params[:user_model].constantize
    rescue NameError
      wolves!(self, user_model_not_found: "User model #{params[:user_model]} not found")
    end
  end
end
