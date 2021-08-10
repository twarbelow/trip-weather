class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by('email = ?', params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user), status: :ok
    else
      render status: :unauthorized, body: 'Invalid Credentials'
    end
  end
end
