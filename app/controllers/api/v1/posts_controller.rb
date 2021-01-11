class Api::V1::PostsController < ApplicationController
    before_action :find_post, only: [:show, update]

    def index
        @posts = Post.all
        render json: @posts 
    end

    def show 
        render json: @post
    end 

    def create
        @post = Post.create(post_params)
        render json: @post
    end 

    def update 
        @post.update(post_params)

        render json: @post  
    end 
    
    private 

    def post_params
        params.require(:post).permit(:id, :title, :content)
    end

    def find_post
        @post = Post.find(params[:id])
    end 

end 
