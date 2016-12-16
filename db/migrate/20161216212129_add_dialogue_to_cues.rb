class AddDialogueToCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :dialogue, :text
  end
end
