class RecipesController < ApplicationController
    def new 
        @recipe = Recipe.new   
        @recipe.ingredients.build(name: "First Ingredient")
        @recipe.ingredients.build(name: "Second Ingredient")     
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save 
        redirect_to recipes_path      
        else
            render :new  
        end
    end

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @recipes = @user.recipes
        else
            @error = "Sorry, that receipe doesn't exist" if params[:user_id]
            @recipes = Recipe.all 
        end
    end
    
    def show 
        @recipe = Recipe.find(params[:id])
    end
  

    def edit
        @recipe = Recipe.find(params[:id])
    end 

   private
    def recipe_params
        params.require(:recipe).permit(
            :title,
            :content,
            ingredients_attributes: [:quantity, :name, :measurement]
          )
    end
end
