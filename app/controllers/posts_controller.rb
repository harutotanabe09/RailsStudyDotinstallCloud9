class PostsController < ApplicationController

    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        # LaravelのDDみたいなやつ
        # render plain: params[:post].inspect

        # Privateメソッドで入力チェックする
        @post = Post.new(post_params)
            if @post.save
        
                # redirect
                redirect_to posts_path
            else
                # DDでエラーを見る
                # render plain: @post.errors.inspect 
                render 'new'
            end
    end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
