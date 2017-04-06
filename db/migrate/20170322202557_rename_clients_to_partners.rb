class RenameClientsToPartners < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :clients, :partners
  end

  def self.down
    rename_table :partners, :clients
  end
end
