class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.update(@tweet, partial: "tweets/form", locals: { tweet: @tweet})}
    end
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_tweet', partial: "tweets/form", locals: {tweet: Tweet.new}),
            turbo_stream.prepend('tweets', partial: "tweets/tweet", locals: {tweet: @tweet}),
            turbo_stream.update('tweet_count', Tweet.count),
            turbo_stream.update('notice',"Tweet created Successfully")
          ]
        end

        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_tweet', partial: "tweets/form", locals: {tweet: @tweet})
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update(@tweet, partial: "tweets/tweet", locals: { tweet: @tweet}),
            turbo_stream.update("notice", "Tweet Updated Successfully")
          ]
        end
        
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.turbo_stream {render turbo_stream: turbo_stream.update(@tweet, partial: "tweets/form", locals: { tweet: @tweet})}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: [
          turbo_stream.remove(@tweet),
          turbo_stream.update('tweet_count', Tweet.count),
          turbo_stream.update('notice', "Tweet Deleted Successfully")
        ]
      end
      
     
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
