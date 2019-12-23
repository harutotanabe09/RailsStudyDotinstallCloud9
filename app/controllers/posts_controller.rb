class PostsController < ApplicationController

    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
    end

    def create
        # LaravelのDDみたいなやつ
        # render plain: params[:post].inspect

        # Privateメソッドで入力チェックする
        @post = Post.new(post_params)
        @post.save
        # redirect
        redirect_to posts_path
    end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
