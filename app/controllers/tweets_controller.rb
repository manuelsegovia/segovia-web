class TweetsController < InheritedResources::Base
	before_action :authenticate_user!, except: [:index, :show]

	def new
		@tweet = current_user.tweets.new
	end 

	def create
		@tweet =current_user.tweets.new(tweet_params)
		if @tweet.save
			redirect_to @tweet, notice: 'Tweets was succesfully created'
		else
			render :new
		end	
	 end
	def edit
		@tweet = current_user.tweets.find(params[:id])
		
	end

	def update
		@tweet = current_user.tweets.find(params[:id])
		if @tweet.update(tweet_params)
			redirect_to @tweet, notice: 'Tweets was succesfully updated'
			
		else
			render :edit
		end
		
	end

	def destroy
		@tweet = current_user.tweets.find(params[:id])
		@tweet.destroy
		redirect_to tweets_url, notice: 'Tweet was succesfully destroyed'	
	end
# original code
  private

    def tweet_params
      #params.require(:tweet).permit(:user_id, :content)
      params.require(:tweet).permit(:content, :image)
    end
end

