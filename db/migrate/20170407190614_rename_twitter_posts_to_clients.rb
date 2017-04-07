class RenameTwitterPostsToClients < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :twitter_posts, :clients
  end

  def self.down
    rename_table :clients, :twitter_posts
  end
end
