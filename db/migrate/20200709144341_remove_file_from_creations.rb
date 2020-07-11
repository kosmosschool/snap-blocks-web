class RemoveFileFromCreations < ActiveRecord::Migration[6.0]
  def change
    remove_column :creations, :file
  end
end
