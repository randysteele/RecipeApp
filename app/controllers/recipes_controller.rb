class RecipesController < ApplicationController
     before_action :redirect_if_not_logged_in    

    def new 
        @recipe = Recipe.new      
        @recipe.ingredients.build(name: "Ingredient One")
        @recipe.ingredients.build(name: "Ingredient Two")
        @recipe.ingredients.build(name: "Ingredient Three")
        @recipe.ingredients.build(name: "Ingredient Four")  
        @recipe.ingredients.build(name: "Ingredient Five") 
        @recipe.ingredients.build(name: "Ingredient Six") 
        @recipe.ingredients.build(name: "Ingredient Seven") 
        @recipe.ingredients.build(name: "Ingredient Eight") 
        @recipe.ingredients.build(name: "Ingredient Nine") 
        @recipe.ingredients.build(name: "Ingredient Ten") 
    end

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @recipes = @user.recipes
        else
            @error = "Sorry, that receipe doesn't exist" if params[:user_id]
            @recipes = Recipe.alpha
        end
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save 
        redirect_to recipes_path      
        else
            render :new  
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end 

    def update 
        if @recipe.update(recipe_params)
          redirect_to recipe_path(@recipe)
        else
          render :edit
        end
      end

    
    def show 
        @recipe = Recipe.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe
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