module Api
    module V1
        class UsersController < ApplicationController

          def index
            @posts = User.all
            render json: @posts
          end


          def create
            @user = User.new(user_params)
           if @user.save
            render status: :created
           end
          end

      private

        def user_params
           params.require(:user).permit(:name)
        end
      end
   end
end
