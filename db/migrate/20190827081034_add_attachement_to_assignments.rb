class AddAttachementToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :attachment, :string
  end
end
