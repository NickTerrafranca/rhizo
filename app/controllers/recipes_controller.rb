class RecipesController < ApplicationController
  before_action :logged_in_user

  def index
    @recipes = current_user.recipes.all.order(created_at: :desc)
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
      redirect_to recipe_path(@recipe)
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
      flash[:success] = 'Recipe updated'
      redirect_to edit_recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:success] = 'Recipe deleted'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Unable to delete'
      render 'edit'
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(
        :title,
        :description,
        recipe_line_items_attributes: [
          :id,
          :concentration_variable,
          :_destroy,
          quantity_attributes: [:unit, :amount],
          ingredient_attributes:[:name]
        ])
    end
end
