class TweetFetcherService
	def self.get_tweets
		@clients.each do |client| # For each client in the array
			TwitterApi.our_public_tweets(client.twitter_handle,  5).each do |tweet| # Grab 20 of the most recent tweets
				@tweets << { data: tweet, handle: client.twitter_handle } # Distinguishes which tweet belongs to an author. Creates an array of hashes with the tweet and author.
			end
		end
	end

	def self.format_tweets
		@tweets.sort! { |a, b| b[:data].created_at <=> a[:data].created_at } # Sorts the tweets according to when they were created. The tweet object has a created_at attribute.
	end

	def self.get_posts(clients)
		@clients = clients 
		@tweets = []
		get_tweets
		format_tweets
		@tweets
	end
end