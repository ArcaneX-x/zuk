class ResetPasswordsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      user.create_token && user.password_sent_at

      if user.save
        # TODO send email to a user
        redirect_to root_path, notice: 'На ваш email отправлено письмо с инструкциями по восстановлению пароля.'
      else
        redirect_to reset_password_path, alert: 'Что-то пошло не так. Попробуйте еще раз.'
      end
    else
      redirect_to new_reset_password_path, alert: 'Пользователь с таким email не найден.'
    end
  end

  def edit
  end

  def update
    user = User.find_by(reset_password_token: params[:token])

    if user && user.reset_password_sent_at > 1.hour.ago
      if user.update(user_params)
        user.update(reset_password_token: nil, reset_password_sent_at: nil)
        redirect_to root_path, notice: 'Пароль успешно изменен.'
      else
        render :edit
      end
    else
      redirect_to new_reset_password_path, alert: 'Время действия ссылки истекло. Попробуйте восстановить пароль заново.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
