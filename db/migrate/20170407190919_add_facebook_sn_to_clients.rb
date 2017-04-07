class AddFacebookSnToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :facebook_sn, :string
  end
end
