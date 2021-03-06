class TwitterApi
	def self.our_public_tweets(handle, count=1)
		client.user_timeline(handle, count: count, exclude_replies: true, inlcude_rts: false)
	end

	def self.client
		@client ||= Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
		  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
		end
	end
end