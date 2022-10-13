class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new task_params
        if @post.save
            redirect_to posts_path, notice: "Task created."
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @post = Post.find params[:id]
    end
    
    def task_params
        params.require(:post).permit(:content, :parent_id, :mood, :country)
    end
end
