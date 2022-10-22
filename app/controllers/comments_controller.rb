class CommentsController < ApplicationController
   def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(post_id: params[:post_id])
  end

  # def create
  #       @comment = @post.comments.new post_params
  #       if @comment.save
  #           redirect_to posts_path, notice: "Post created."
  #       else
  #           render :new, status: :unprocessable_entity
  #       end
  # end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
end
