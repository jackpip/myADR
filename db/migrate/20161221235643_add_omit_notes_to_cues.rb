class AddOmitNotesToCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :omit_notes, :text
  end
end
