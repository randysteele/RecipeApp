class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :display_recipes

  private
  def current_user
   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
     redirect_to '/' if !logged_in?
  end

  # def display_recipes
  #   if @user.recipes.empty?
  #     tag.h2(link_to('No recipes yet - write a recipe here', new_recipe_path))
  #   else
  #     user = @user == current_user ? 'Your' : "#{@user.username}'s"
  #     content_tag(:h2, "#{user} #{pluralize(@user.recipes.count, 'Recipe')}:")    
  #   end
  # end
end