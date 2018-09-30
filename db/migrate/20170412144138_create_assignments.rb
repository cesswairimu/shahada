class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :unit_code
      t.string :assignment
      t.string :title
      t.date :due_date
      t.references :lecturer, foreign_key: true

      t.timestamps
    end
  end
end
