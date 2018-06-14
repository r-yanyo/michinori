json.set! :posts do
  json.array! @posts.page(params[:page] ||= 1).per(20) do |post|
    json.extract! post, :id, :title, :content, :likeNum, :user_id, :author, :created_at, :updated_at
  end
end
