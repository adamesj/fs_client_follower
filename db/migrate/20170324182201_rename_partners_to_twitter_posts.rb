class RenamePartnersToTwitterPosts < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :partners, :twitter_posts
  end

  def self.down
    rename_table :twitter_posts, :partners
  end
end
