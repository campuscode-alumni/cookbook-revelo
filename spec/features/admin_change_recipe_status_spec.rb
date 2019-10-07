require 'rails_helper'

feature 'Admin change recipe status' do
  scenario 'and view pending recipes' do
    admin = User.create!(email: 'test@test.com', password: '1234567', 
                         role: :admin)
    user = User.create!(email: 'test@test.com', password: '1234567')
    recipe_type = RecipeType.create!(name: 'Sobremesa')
    pending_recipe = Recipe.create!(title: 'Bolo de cenoura', recipe_type: 'Sobremesa', 
      cuisine: 'Brasileira', difficulty: 'Médio', cook_time: 60, 
      ingredients: 'Farinha, açucar, cenoura', 
      cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, '\
      'misture com o restante dos ingredientes', user: user)

    login_as user, scope: :user
    visit root_path
    click_on 'Receita pendentes'

    expect(page).to have_link('Aprovar', count: 2)
    expect(page).to have_link('Rejeitar', count: 2)
    expect(page).to have_content(pending_recipe.title)
    expect(page).to have_content(other_pending_recipe.title)
    expect(page).not_to have_content(approved_recipe.title)
  end
end