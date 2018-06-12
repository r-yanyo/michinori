json.set! :post do
  json.extract! @user, :id, :name, :email
end
