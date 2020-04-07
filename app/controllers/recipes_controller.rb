class RecipesController < ApplicationController
    def index 
        @recipes = Recipe.all 
    end
    
    def show 
        @recipe = Recipe.find_by(id: params[:id])
    end

    def new 
        @recipe = Recipe.new
    end

    def create 
        recipe = Recipe.create(recipe_params)
        redirect_to edit_recipe_path
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end 



    private 
    def recipe_params
        params.require(:title).permit(
            :content)
    end
end
