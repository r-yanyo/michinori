# create administor
@user = User.create!(name: "admin", email: "honma.ryosuke@gmail.com", password: "foobar", name: "user"+i.to_s(), remember_token: User.encrypt(User.new_remember_token))
