class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Receita criada com sucesso!'
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit; end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type, :cuisine,
                                   :difficulty, :cook_time, :ingredients,
                                   :cook_method)
  end
end