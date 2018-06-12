json.set! :post do
  json.extract! @user, :id, :name, :email, :remember_token
end
