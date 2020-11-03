class AddColumnToArtCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :article_categories, :meble_id, :integer
  end
end
