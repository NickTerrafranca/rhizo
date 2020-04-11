class RecipesController < ApplicationController
  before_action :logged_in_user

  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    if @recipe.save
      flash[:info] = 'Recipe added'
      redirect_to recipes_path
    else
      flash[:error] = 'Womp womp...'
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = 'Success'
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :description)
    end
end