# frozen_string_literal: true

# this is post controller
class PostsController < ApplicationController
  before_action :authorized, only: %i[create update destroy]
  before_action :admin, only: %i[create update destroy]
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    @posts = Post.includes(:author, :rich_text_content)

    render json: PostSerializer.new(@posts).serializable_hash[:data].map { |hash| hash[:attributes] }
  end

  # GET /posts/1
  def show
    render json: PostSerializer.new(@post).serializable_hash[:data][:attributes]
  end

  # POST /posts
  def create
    @post = Post.new({ title: post_params[:title], content: post_params[:content], author_id: current_user.id })

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.includes(:author, :content_attachment).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
