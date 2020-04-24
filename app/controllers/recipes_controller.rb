class RecipesController < ApplicationController
     before_action :redirect_if_not_logged_in    

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @recipe = @user.recipes.build
          @recipe.ingredients.build(name: "Ingredient Name")
        else
          @recipe = Recipe.new
        end
    end

    def create   
        @recipe = current_user.recipes.build(recipe_params) 
         if @recipe.save
             redirect_to recipes_path
         else
            binding.pry
         render :new
         end
    end


    def index 
        if params[:user_id] && @user = User.find_by_id(params[:id])
          @recipes = @user.recipes
        else
            @error = "Sorry, that receipe doesn't exist" if params[:id]
            @recipes = Recipe.alpha
        end
    end



    def edit
        @recipe = Recipe.find_by_id(params[:id])
    end 

    
    def show 
        @recipe = Recipe.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe 
    
end

    def destroy
        Recipe.find(params[:id]).destroy
        redirect_to recipe_url
    end

  
    def recipe_params
        params.require(:recipe).permit(:title, :content,  ingredients_attributes: [:quantity, :name, :measurement]
          )
    end
end