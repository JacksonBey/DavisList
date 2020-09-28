class CommentsController < ApplicationController

    before_action :get_comment, only [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        @path = @comment.listing
        redirect_to listing_path(@path)
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        @path = @comment.listing
        redirect_to listing_path(@path)
    end

    def destroy
        @path = @comment.listing
        @comment.destroy
        redirect_to listing_path(@path)
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :user_id, :listing_id)
    end

    def get_comment
        @comment = Comment.find(params[:id])
    end
end
