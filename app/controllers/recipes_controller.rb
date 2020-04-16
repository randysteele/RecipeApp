class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

   # helper_method :display_recipes

    
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
       #
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

    def display_recipes
        if @user.recipes.empty?
          tag.h2(link_to('No recipes yet - write a recipe here', new_recipe_path))
        else
          user = @user == current_user ? 'Your' : "#{@user.username}'s"
          content_tag(:h2, "#{user} #{pluralize(@user.recipes.count, 'Recipe')}:")    
        end
      end
end
