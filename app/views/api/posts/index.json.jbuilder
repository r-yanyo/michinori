json.set! :posts do
  json.array! @posts do |post|
    json.extract! post, :id, :title, :content, :likeNum, :author, :created_at, :updated_at
  end
end
