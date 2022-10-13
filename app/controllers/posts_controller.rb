class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new post_params
        if @post.save
            redirect_to posts_path, notice: "Task created."
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @post = Post.find params[:id]
    end
    
    def edit
        @post = Post.find params[:id]
    end
    
    def update
        @post = Post.find params[:id]
        if @post.update post_params
            redirect_to @post, notice: "Post was updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find params[:id]
        @post.destroy
        redirect_to posts_path, alert: "Post was deleted"
    end
    
    def post_params
        params.require(:post).permit(:content, :parent_id, :mood, :country)
    end
end
