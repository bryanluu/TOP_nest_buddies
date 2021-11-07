class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ new create edit update destroy ]
  before_action :set_comment, only: %i[ edit update destroy ]
  before_action :authorize_user, only: %i[ edit update destroy ]


  # GET /posts/1/comments/new
  def new
    @comment = Comment.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
      puts "AAA"
    end

    def set_comment
      @comment = Comment.find(params[:id])
      puts "GGG"
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end

    def authorize_user
      unless @comment.author == current_user
        flash[:error] = "You are not authorized"
        redirect_to @post # halts request cycle
      end
    end
end
