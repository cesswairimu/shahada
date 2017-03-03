class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :reg_no
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :phone
      t.string :school

      t.timestamps
    end
  end
end
