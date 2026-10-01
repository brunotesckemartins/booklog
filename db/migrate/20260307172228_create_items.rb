class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :item_type
      t.integer :status
      t.integer :rating
      t.string :author
      t.string :publisher
      t.integer :year
      t.string :purchase_link
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
