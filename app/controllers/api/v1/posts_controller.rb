module Api
  module V1
    class PostsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods

      def index
        @posts = Post.all

        render json: @posts
      end

      def create
        @post = @user.posts.new(post_params)
        if @post.save
          render json: @post, status: :created
        end
      end

      def destroy
        @post = @user.posts.find_by(params[:id])
        if @post
          @post.destroy
        else
          render json: {post: "Not found"}, status: :not_found
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :body)
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by(token: token)
        end
      end
    end
  end
end
