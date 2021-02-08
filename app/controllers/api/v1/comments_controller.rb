class Api::V1::CommentsController < ApplicationController

    def index
        @comments = Comment.all
        render json: @comments, adapter: :json
    end

    def show 
        @comment = Comment.find(params[:id])
        render json: @comment
    end 

    def create
        @comment = Comment.create(comment_params) 
        render json: @comment
    end 

    private 

    def comment_params
        params.require(:comment).permit(:id, :body, :post_id)
    end

end
