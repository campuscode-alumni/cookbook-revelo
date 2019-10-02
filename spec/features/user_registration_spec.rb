feature
  scenario 'successfully' do
  end

  scenario 'and sign in' do
    user = User.create!(email: 'test@test.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: '....'
    fill_in 'Senha', with: '....'
    click_on 'Login'
    
    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Login')
  end

  scenario 'and sign out' do
  end