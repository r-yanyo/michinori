class Api::PostsController < ApplicationController
  before_action :set_user, only: [:create, :delete]

  # GET /api/posts, /api/users/posts
  def index
    if @user
      @posts = Post.find_by!(user_id: @user.id).order('created_at DESC')
    else
      @posts = Post.order('created_at DESC')
    end
  end

  # POST /api/posts, /api/users/posts
  def create
    if @user
      @post = Post.new(post_params.merge(user_id: @user.id))
    else
      @post = Post.new(post_params)
    end

    if @post.save(post_params)
      render :show, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/users/posts/:id
  def destroy
    @post = Post.find(params[:id])
    if @user.id == @post.user_id
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
      @user = User.find_by(remember_token: post_params[:remember_token])
    end

    def post_params
      params.require(:post).permit(:title, :content, :remember_token)
    end
end
