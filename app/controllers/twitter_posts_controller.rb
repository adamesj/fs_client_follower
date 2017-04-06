class TwitterPostsController < ApplicationController
  before_action :set_twitter_post, only: [:show, :edit, :update, :destroy]
  include TwitterPostsHelper

 
  def index
    @twitter_posts = TwitterPost.all
    @posts = TweetFetcherService.get_posts(@twitter_posts)
  end

  def show
    @posts = TweetFetcherService.get_posts([@twitter_post])
  end

  def new
    @twitter_post = TwitterPost.new
  end

  def edit
  end

  def create
    @twitter_post = TwitterPost.new(twitter_post_params)

    respond_to do |format|
      if @twitter_post.save
        format.html { redirect_to @twitter_post, notice: 'Twitter post was successfully created.' }
        format.json { render :show, status: :created, location: @twitter_post }
      else
        format.html { render :new }
        format.json { render json: @twitter_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @twitter_post.update(twitter_post_params)
        format.html { redirect_to @twitter_post, notice: 'Twitter post was successfully updated.' }
        format.json { render :show, status: :ok, location: @twitter_post }
      else
        format.html { render :edit }
        format.json { render json: @twitter_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @twitter_post.destroy
    respond_to do |format|
      format.html { redirect_to twitter_posts_url, notice: 'Twitter post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_twitter_post
      @twitter_post = TwitterPost.find(params[:id])
    end

    def twitter_post_params
      params.require(:twitter_post).permit(:name, :description, :twitter_handle)
    end
end
