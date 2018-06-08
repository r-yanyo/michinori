class Api::PostsController < ApplicationController
  # GET /api/posts
  def index
    @posts = Post.order('updated_at DESC')
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

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
