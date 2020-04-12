class IngredientsController < ApplicationController

    def new 
        @ingredient = Ingredient.new 
    end

    def edit 
        @ingredient = Ingredient.find(params[:id])
    end

    def create
            @ingredient = Ingredient.create(ingredient_params)
            if @comment.save
                redirect_to comments_path
            else
                render :new
            end
          end




private

        def ingredient_params
            params.require(:ingredient)permit(:quantity, :measurement)
        end
end
