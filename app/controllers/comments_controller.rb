class CommentsController < ApplicationController

    before_action :get_comment, only: [:show, :edit, :update]
    skip_before_action :fetch_user, only: [:show]
    skip_before_action :save_my_previous_url

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
        @comment = Comment.find(params[:format])
        @comment.destroy
        redirect_to session[:my_previous_url]
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :listing_id)
    end

    def get_comment
        @comment = Comment.find(params[:id])
    end
end
