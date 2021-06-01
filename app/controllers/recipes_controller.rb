class RecipesController < ApplicationController
  def index
    @recipes = RecipeService.new.recipes
  end

  def show
    @recipe = RecipeService.new.recipe(params[:id])
  end
end
