class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :regno
      t.string :email
      t.string :phonenumber
      t.string :address

      t.timestamps
    end
  end
end
