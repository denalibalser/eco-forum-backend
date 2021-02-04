class Api::V1::PostsController < ApplicationController
    #before_action :find_post, only: [:show, update]

    
    def index
        @posts = Post.all
        render json: @posts, adapter: :json, status: 200
        # render json: {
        #     posts: @posts, 
        #     comments: @posts.map{|post| post.comments.map{|comment| comment}} #have all comments loading in jSON 
            
        # }, status: 200
    end

    def show 
        @post = Post.find(params[:id])
        render json: @post, status: 200
        # render json: {
        #     post: @post, 
        #     comments: @post.comments #comments for specified post are rendered in json
        # }, status: 200
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
