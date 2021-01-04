class RenameCastToCasts < ActiveRecord::Migration[5.2]
  def change
    rename_table :cast, :casts
  end
end
