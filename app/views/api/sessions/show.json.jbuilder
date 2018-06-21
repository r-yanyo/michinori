json.set! :user do
  json.extract! @user, :id, :name, :email, :remember_token
end
