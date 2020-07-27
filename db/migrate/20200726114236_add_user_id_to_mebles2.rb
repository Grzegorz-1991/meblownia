class AddUserIdToMebles2 < ActiveRecord::Migration[6.0]
  def change
    add_column :mebles, :user_id, :int
  end
end
