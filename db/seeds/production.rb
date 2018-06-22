# create administor
@user = User.create!(name: "admin", email: "honma.ryosuke@gmail.com", password: ENV["ADMIN_PASS"], remember_token: User.encrypt(User.new_remember_token))
