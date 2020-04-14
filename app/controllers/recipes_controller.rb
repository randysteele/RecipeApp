class RecipesController < ApplicationController
    def new 
        @recipe = Recipe.new      
        @recipe.ingredients.build(name: "Ingredient One")
        @recipe.ingredients.build(name: "Ingredient Two")
        @recipe.ingredients.build(name: "Ingredient Three")  
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save 
        redirect_to recipes_path      
       # binding.pry
        else
            render :new  
        end
    end

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @recipes = @user.recipes
        else
            @error = "Sorry, that receipe doesn't exist" if params[:user_id]
            @recipes = Recipe.alpha
        end
    end
    
    def show 
        @recipe = Recipe.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe
    end
  

    def edit
        @recipe = Recipe.find(params[:id])
    end 

   private
    def recipe_params
        params.require(:recipe).permit(
            :title,
            :content,
            ingredients_attributes: [:quantity, :name, :measurement, :recipe_id]
          )
    end
end
