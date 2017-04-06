class User < ApplicationRecord
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
	end

  def facebook # call to the facebook API after authentication
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def get_post_message(client_handle) # returns an array of hashes from the client's page
    all_posts = facebook.get_connection(client_handle, "posts", {
      fields: ['message', 'link', 'created_time', 'updated_time']
    })
    post = all_posts.first
    post["message"]
  end

  def get_post_picture(client_handle) # returns an array of hashes from the client's page
    all_posts = facebook.get_connection(client_handle, "posts").first
    picture = facebook.get_connection(all_posts['id'], 'attachments').first
    picture["media"]["image"]["src"]
  end
end
