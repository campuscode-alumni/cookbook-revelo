require 'rails_helper'

feature 'User register recipe' do
  scenario 'cannot create logged out' do
    visit root_path
    
    expect(page).not_to have_link('Enviar uma receita')
  end

  scenario 'and visit via route' do
    visit new_recipe_path

    expect(current_path).to eq new_user_session_path  
  end

  scenario 'successfully' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    user = login

    # simula a ação do usuário
    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Tabule'
    fill_in 'Tipo da Receita', with: 'Entrada'
    fill_in 'Cozinha', with: 'Arabe'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    click_on 'Enviar'


    # expectativas
    expect(page).to have_css('h1', text: 'Tabule')
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: 'Entrada')
    expect(page).to have_css('p', text: 'Receita enviada por: teste@test.com.br')
    expect(page).to have_css('p', text: 'Arabe')
    expect(page).to have_css('p', text: 'Fácil')
    expect(page).to have_css('p', text: "45 minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha')
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text:  'Misturar tudo e servir. Adicione limão a gosto.')
  end
end
