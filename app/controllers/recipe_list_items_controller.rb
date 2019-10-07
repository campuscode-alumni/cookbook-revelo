class RecipeListItems < ApplicationController
  def create
    @recipe = Recipe.find(params[:id])
    @list = List.find(params.require(:recipe_list_item).permit(:list_id))

    @recipe.recipe_list_items.create(list: @list)
    redirect_to @recipe
  end
end