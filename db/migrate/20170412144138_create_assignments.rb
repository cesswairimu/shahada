class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :unit_code
      t.string :unit_name
      t.string :title
      t.time :due_date

      t.timestamps
    end
  end
end
