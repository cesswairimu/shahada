class ChangeColumnAnswerDatatype < ActiveRecord::Migration[5.0]
  def change
    change_column :questions, :answer, :text
  end
end
