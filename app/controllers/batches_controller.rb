class BatchesController < ApplicationController
  before_action :logged_in_user

  def index
    @recipe = Recipe.find(params[:recipe_id])
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @batch = Batch.find(params[:id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @batch = @recipe.batches.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @batch = @recipe.batches.create(batch_params)
    if @batch.save
      flash[:info] = "Batch created for #{@recipe.title}"
      redirect_to recipe_batch_path(@recipe, @batch)
    else
      flash[:error] = 'Womp womp...'
      render :new
    end
  end

  def edit
    @batch = Batch.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @batch = Batch.find(params[:id])
    if @batch.update(batch_params)
      flash[:info] = "Batch updated for #{@batch.recipe.title}"
      redirect_to recipe_batch_path
    else
      flash[:error] = 'Womp womp...'
      render :new
    end
  end

  def destroy
    batch = Batch.find(params[:id])
    recipe = Recipe.find(params[:recipe_id])
    if batch.destroy
      flash[:info] = "Batch deleted!!!"
      redirect_to recipe_batches_path(recipe)
    else
      flash[:error] = 'Something went wrong'
      render recipe_batch_path(recipe)
    end
  end

    private

    def batch_params
      params.require(:batch).permit(:name, :notes, :multiplier, :concentration, :prep_date)
    end

end
