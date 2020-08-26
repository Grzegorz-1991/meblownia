class AddTimeStampsToMebles < ActiveRecord::Migration[6.0]
  def change
    add_column :mebles, :created_at, :datetime
    add_column :mebles, :update_at, :datetime
  end
end
