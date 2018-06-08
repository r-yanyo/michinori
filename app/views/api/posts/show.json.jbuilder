json.set! :post do
  json.extract! @post, :id, :title, :content, :created_at, :updated_at
end
