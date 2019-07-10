class TweetsController < ApplicationController

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @tweets = Tweet.new
  end

  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
  end

  

  def destroy
    tweet = Tweet.find(params[:id])
      tweet.destroy
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  private
  def tweet_params
    params.permit(:text)
  end
end
