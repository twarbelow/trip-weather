module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: :create
      
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
