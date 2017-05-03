class RenameUnitNameToAttachment < ActiveRecord::Migration[5.0]
  def change
    rename_column :assignments, :unit_name, :attachment
  end
end
