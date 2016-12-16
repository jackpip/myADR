class AddShowIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :show_id, :integer
  end
end
