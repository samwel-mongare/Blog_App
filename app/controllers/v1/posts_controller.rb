module V1
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    def index
      @posts = current_user.posts.paginate(page: params[:page], per_page: 20)
      json_response(@posts)
    end

    def create
      @post = current_user.posts.create!(post_params)
      json_response(@post, :created)
    end

    # GET /posts/:id
    def show
      json_response(@post)
    end

    # PUT /posts/:id
    def update
      @post.update(post_params)
      head :no_content
    end

    # DELETE /posts/:id
    def destroy
      @post.destroy
      head :no_content
    end

    private

    def post_params
      params.permit(:title)
    end

    def set_post
      @post = post.find(params[:id])
    end
  end
end
