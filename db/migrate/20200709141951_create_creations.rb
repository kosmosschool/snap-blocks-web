class CreateCreations < ActiveRecord::Migration[6.0]
  def change
    create_table :creations do |t|
      t.string :title
      t.references :user
      t.string :storage_url

      t.timestamps
    end
  end
end
