class RecipesController < ApplicationController
     before_action :redirect_if_not_logged_in    

    def new 
        # if params[:user_id] && @user = User.find_by_id(params[:user_id])    
            @recipe = Recipe.new 
            @recipe.ingredients.build
            @recipe.ingredients.build
            @recipe.ingredients.build
        # end 
    end

    
    def create 
     @recipe = Recipe.new(recipe_params)
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
            @recipes = Recipe.alpha
        end
    end


    def edit
        @recipe = Recipe.find(params[:id])
    end 

    
    def show 
        @recipe = Recipe.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe 
    end 
end

   private
    def recipe_params
        params.require(:recipe).permit(
            :title,
            :content,
            ingredients_attributes: [:quantity, :name, :measurement]
          )
     
end