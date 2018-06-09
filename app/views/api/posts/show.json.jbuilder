json.set! :post do
  json.extract! @post, :id, :title, :content, :likeNum, :created_at, :updated_at
end
