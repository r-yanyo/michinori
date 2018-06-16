json.set! :post do
  json.extract! @post, :id, :title, :content, :likeNum, :author, :created_at, :updated_at
end
