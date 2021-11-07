class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy like unlike ]
  before_action :authorize_user, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.by_buddies_of(current_user).or(Post.where(author: current_user)).distinct.order(created_at: :desc).limit(5)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    like = @post.likes.build(user: current_user)

    if like.save
      redirect_to @post, notice: "Post was liked."
    else
      render :show, status: :unprocessable_entity
    end
  end

  def unlike
    like = @post.likes.where(user: current_user).first
    like.destroy
    redirect_to @post, notice: "Post was unliked."
  end

  private
    def authorize_user
      unless @post.author == current_user
        flash[:error] = "You are not authorized"
        redirect_to posts_url # halts request cycle
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content)
    end
end
