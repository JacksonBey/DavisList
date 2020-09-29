class CommentsController < ApplicationController

    before_action :get_comment, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.valid?
            redirect_to @comment.listing
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to listing_path(@comment.listing)
        end
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        if @comment.valid?
            redirect_to listing_path(@comment.listing_path)
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to edit_comment_path(@comment)
        end
    end

    def destroy
        @path = @comment.listing_path
        @comment.destroy
        redirect_to listing_path(@path)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :listing_id)
    end

    def get_comment
        @comment = Comment.find(params[:id])
    end
end
