class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers do |t|
      t.string :id_no
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :phone
      t.string :school
      t.string :password_digest
      t.string :activation_digest
      t.boolean :activated
      t.datetime :activated_at

      t.timestamps
    end
  end
end
