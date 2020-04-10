class CommentsController < ApplicationController

    def index
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
           @comments = @recipe.comments
        else
          @error = "That recipe doesn't exist" if params[:recipe_id]
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
      end

      def edit
      end


      private
      def comment_params
        params.require(:comment).permit(:content, :recipe_id)
      end

      def set_comment
        @comment = Comment.find_by(id: params[:id])
        if !@comment
          flash[:message] = "Comment was not found"
          redirect_to comments_path
        end
      end

end