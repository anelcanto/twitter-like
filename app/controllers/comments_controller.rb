class CommentsController < ApplicationController
  before_action :load_post
  before_action :load_comment
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    if @post.comments << @comment
      redirect_to post_path(@post,@comment), notice: "Comment Created"
    else
      render :new, status: :unprocessable_entity
    end
       
  end

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
  
  def load_comment
    @comment = Comment.find params[:post_id]
  end
  
  def load_post
    @post = Post.find params[:post_id]
  end
  
  def comment_params
    params.require(:comment).permit(:content, :post_id, :mood)
  end
end
