class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def create
    if user_params[:password] == user_params[:password_confirmation]
      user = User.new(user_params)
      if user.save
        user.update(api_key: SecureRandom.hex(26))
        render json: UsersSerializer.new(user), status: :created
      else
        render status: :bad_request, body: user.errors.full_messages.to_sentence
      end
    else
      render status: :unauthorized, body: 'Invalid Credentials'
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
