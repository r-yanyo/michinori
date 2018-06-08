json.set! :posts do
  json.array! @posts do |post|
    json.extract! post, :id, :title, :content, :created_at
  end
end
