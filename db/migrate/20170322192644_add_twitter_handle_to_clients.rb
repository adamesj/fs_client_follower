class AddTwitterHandleToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :twitter_handle, :string
  end
end
