class Api::PostsController < ApplicationController
  # GET /api/posts
  def index
    @posts = Post.order('created_at DESC')
  end

  # POST /api/posts
  def create
    @post = Post.new(post_params)
    if @post.save(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # POST /api/like/post/:id
  def add_like_num
    @post = Post.find(params[:post_id])
    @post.likeNum += 1
    if @post.save
      render :show, status: :ok
    else
      render json: @post.errors, status: :internal_server_error
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
