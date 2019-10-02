module LoginHelper
  def login
    user = User.create!(email: 'test@t.com', password: '123456')
    login_as user, scope: :user
    user
  end
end