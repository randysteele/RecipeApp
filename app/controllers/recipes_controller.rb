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
         render :new
         end
    end

    def index 
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @recipes = @user.recipes.alpha
      else
          @recipes = Recipe.alpha.all
      end
      @recipes = @recipes.search(params[:q].downcase) if params[:q] && !params[:q].empty?
  end
 
    def edit
        @recipe = Recipe.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe || @recipe.user != current_user
    end
    

     def update 
        @recipe = Recipe.find_by(id: params[:id])    
          redirect_to recipe_path if !@recipe || @recipe.user != current_user
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


    def destroy
        Recipe.find(params[:id]).destroy
        redirect_to recipe_url
    end

    def most_comments
        @recipes = Recipe.most_comments
    end

  private
    def recipe_params
        params.require(:recipe).permit(:title, :content, ingredients_attributes: [:quantity, :name, :measurement]
        )
    end

    
end