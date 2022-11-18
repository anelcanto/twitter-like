class PostsController < ApplicationController
    before_action :load_post, except: [:index, :new, :create]
    before_action :authenticate, except: [:index, :show, :new]
    before_action :verify_ownership, except: [:index, :show, :create, :new]


    
    # GET   /posts         
    def index
        # logout
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
    end
    
    # GET   /posts/:id/edit
    def edit
    end
    
    #  PATCH (or PUT)  /posts/:id
    def update
        if @post.update post_params
            redirect_to @post, notice: "Post was updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    #  DELETE /posts/:id
    def destroy
        @post.destroy
        redirect_to posts_path, alert: "Post  deleted"
    end
    
    def post_params
        params.require(:post).permit(:content, :mood, :country)
    end
    
    def verify_ownership
        unless current_user == @post.user
             redirect_to root_path, notice: "Not authorized"
        end
    end
    
    def load_post
        @post = Post.find params[:id]
    end
end
