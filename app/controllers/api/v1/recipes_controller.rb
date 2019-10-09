class Api::V1::RecipesController < Api::V1::ApiController

  def index
    render json: Recipe.where(params.permit(:status))
  end

  def show
    @recipe = Recipe.find(params[:id])

    render json: @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])

    return render json: { errors: @recipe.errors.full_messages }, 
           status: :unprocessable_entity unless @recipe.update(recipe_params)

    render json: @recipe 
  rescue
    render json: { message: 'Erro!' }, status: :unprocessable_entity
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy
  end
end