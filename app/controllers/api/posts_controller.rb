class Api::PostsController < ApplicationController
  before_action :set_user, only: [:index, :create, :destroy]

  # GET /api/posts, /api/users/:id/posts
  def index
    if params[:id]
      @posts = Post.where(user_id: params[:id]).order('created_at DESC')
    else
      @posts = Post.order('created_at DESC')
    end
  end

  # GET /api/posts/:id
  def show
    @post = Post.find(params[:id])
    if @post
      render :show, status: :ok
    else
      render json: @post.errors, status: :not_found
    end
  end

  # POST /api/posts
  def create
    if @user
      @post = Post.new(post_params.merge(user_id: @user.id, author: @user.name))
    else
      @post = Post.new(post_params)
    end

    if @post.save(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/posts/:id
  def destroy
    @post = Post.find(params[:id])
    if @user.id == @post.user_id || @user.id == 1
      @post.destroy
      render plain: "success", status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # POST /api/like/post/:post_id
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
    def set_user
      @user = User.find_by(remember_token: request.headers['Authorization'])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
