class Api::V1::PostsController < ApplicationController
    #before_action :find_post, only: [:show, update]


    #need to figure out why I can't delete posts from database!!!!!! 
    #ActiveRecord::InvalidForeignKey (SQLite3::ConstraintException: FOREIGN KEY constraint failed) ????????
    
    def index
        @posts = Post.all
        render json: @posts, status: 200
    end

    def show 
        @post = Post.find(params[:id])
        render json: @post, status: 200
    end 

    def create
        @post = Post.create(post_params)
        render json: @post, status: 200
    end 

    def update 
        @post = Post.find(params[:id]) 
        @post.update(post_params)

        render json: @post, status: 200  
    end 
    
    private 

    def post_params
        params.require(:post).permit(:title, :content, :id)
    end

    # def find_post
    #     @post = Post.find(params[:id])
    # end 

end 
