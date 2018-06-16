json.set! :posts do
  json.array! @posts do |post|
    json.extract! post, :id, :title, :content, :likeNum, :user_id, :author, :created_at, :updated_at
  end
end
