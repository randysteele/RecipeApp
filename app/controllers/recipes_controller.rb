class RecipesController < ApplicationController


    def index 
        @recipes = Recipe.all 
     end

    def new 
        @recipe = Recipe.new
    end

    def create 
        @recipe = Recipe.create(recipe_params)
    end


    def show 
        @recipe = Recipe.find(parmas[:id])
    end




    private 

    def recipe_params
        params.require(:title).permit(:content)
    end
end
