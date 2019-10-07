class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :pending, :approve, :reject]
  before_action :set_recipe, only: %i[show edit update approve]
  before_action :set_recipe_type, only: [:new, :edit]
  before_action :authorize_admin, only: %i[pending approve reject]

  def pending
    @recipes = Recipe.pending
  end

  def approve
    @recipe.approved!
    redirect_to pending_recipes_path
  end

  def index
    @recipes = Recipe.all
  end

  def search
  end

  def show
    @lists = List.all
    @recipe_list_item = RecipeListItem.new
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
  end

  def create
    # @recipe = Recipe.new(recipe_params)
    # @recipe.user = current_user
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Receita criada com sucesso!'
      redirect_to @recipe
    else
      set_recipe_type
      render :new
    end
  end

  def edit
    @recipe_types = RecipeType.all
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_type
    @recipe_types = RecipeType.all
  end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine,
                                   :difficulty, :cook_time, :ingredients,
                                   :cook_method)
  end

  def authorize_admin
    redirect_to root_path unless current_user.admin?
  end
end