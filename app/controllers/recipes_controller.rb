class RecipesController < ApplicationController
    def new 
        @recipe = Recipe.new        
    end

    def index 
        @recipes = Recipe.all 
    end
    
    def show 
        @recipe = Recipe.find(params[:id])
    end
  

    def create 
        @recipe = Recipe.create(recipe_params)
        redirect_to recipes_path        
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end 

   private
    def recipe_params
        params.require(:recipe).permit(
            :title,
            :content,
            :ingredients
          )
    end
end
