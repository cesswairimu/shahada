class AddUsersToQuestions < ActiveRecord::Migration[5.2]
    def down
    add_index :user
  end
end
