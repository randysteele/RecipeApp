class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_comment, only: [:show, :edit, :update]
  layout  "layout"


  

    def index
      if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
        @comments = @recipe.comments
      else
        @comments = Comment.all
        end
      end

    def new 
      if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
        @comment = @recipe.comments.build
      else
        @comment = Comment.new
      end
    end

    def create
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        redirect_to comments_path
      else
        render :new
      end
    end

    def show
      @comment = Comment.find_by_id(params[:id])
    end

    def edit
      @comment = Comment.find_by_id(params[:id])
    end


    def update 
     if @comment.update(comment_params)
      redirect_to comment_path(@comment)
     else
      render :edit
     end
    end

    def destroy
      Comment.find(params[:id]).destroy
      redirect_to recipe_path
    end

private
    def comment_params
      params.require(:comment).permit(:content, :recipe_id)
    end

    def set_comment
     @comment = Comment.find_by(id: params[:id])
    end

end