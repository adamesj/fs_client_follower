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

  def get_picture(client)
    post = facebook.get_connections(client, "posts").first
    picture = facebook.get_connections(post['id'], 'attachments').first
  end
end
