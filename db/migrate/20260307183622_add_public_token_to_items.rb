class AddPublicTokenToItems < ActiveRecord::Migration[8.1]
  def change
    add_column :items, :public_token, :string
  end
end
