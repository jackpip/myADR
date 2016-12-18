class AddAbbrToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :abbr, :string
  end
end
