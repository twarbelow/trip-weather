module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by('email = ?', params[:email])
        if user&.authenticate(params[:password])
          render json: UsersSerializer.new(user), status: :ok
        else
          render status: :unauthorized, body: 'Invalid Credentials'
        end
      end
    end
  end
end
