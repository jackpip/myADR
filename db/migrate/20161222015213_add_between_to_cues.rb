class AddBetweenToCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :between, :boolean
  end
end
