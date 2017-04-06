class TwitterPost < ApplicationRecord
	def self.fetch_image
  	TwitterApi.our_public_tweets("groundlings", 10)
	end
end
