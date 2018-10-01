class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question, foreign_key: true
      t.references :user, polymorphic: true, index: true
      t.integer :user_id
      t.text :user_type

      t.timestamps
    end
  end
end
