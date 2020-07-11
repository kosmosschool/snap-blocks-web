class CreationsRenameStorageUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :creations, :storage_url, :file
  end
end
