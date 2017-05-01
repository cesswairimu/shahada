class AddLectureIndexToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_reference :assignments, :lecturer, foreign_key: true
  end
end
