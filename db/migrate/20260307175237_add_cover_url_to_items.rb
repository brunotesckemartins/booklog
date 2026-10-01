class AddCoverUrlToItems < ActiveRecord::Migration[8.1]
  def change
    add_column :items, :cover_url, :string
  end
end
