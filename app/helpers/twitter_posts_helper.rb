module TwitterPostsHelper
  def profile_image_url(post)
    if post[:data].media.empty?
      post[:data].user.profile_image_url.to_s.gsub(/_normal/, '')
    else
      post[:data].media.first.media_url.to_s
    end
  end
end