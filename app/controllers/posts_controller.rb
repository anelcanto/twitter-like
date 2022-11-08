class PostsController < ApplicationController
    before_action :authenticate, except: [:index, :show]
    
    # GET   /posts         
    def index
        @posts = Post.all
    end
    
    # GET   /posts/new
    def new
        @post = Post.new
    end
    
    # POST  /posts
    def create
        @post = Post.new post_params
        @post.user = current_user
        if @post.save
            redirect_to post_path(@post), notice: "Post created"
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    # GET   /posts/:id
    def show
        @post = Post.find params[:id]
    end
    
    # GET   /posts/:id/edit
    def edit
        @post = Post.find params[:id]
    end
    
    #  PATCH (or PUT)  /posts/:id
    def update
        @post = Post.find params[:id]
        if @post.update post_params
            redirect_to @post, notice: "Post was updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    #  DELETE /posts/:id
    def destroy
        @post = Post.find params[:id]
        @post.destroy
        redirect_to posts_path, alert: "Post  deleted"
    end
    
    def post_params
        params.require(:post).permit(:content, :parent_id, :mood, :country)
    end
end
