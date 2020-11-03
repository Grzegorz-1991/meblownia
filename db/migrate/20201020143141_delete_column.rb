class DeleteColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :article_categories, :article_id
  end
end
