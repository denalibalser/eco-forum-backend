class Api::V1::PostsController < ApplicationController
    def index
        @posts = Post.all
        render json: @posts 
    end
    
    private 

    def post_params
        params.permit(:title, :content)
    end
end
