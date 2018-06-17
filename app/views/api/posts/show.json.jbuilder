json.set! :post do
  json.extract! @post, :id, :title, :content, :likeNum, :user_id, :author, :created_at, :updated_at
end
