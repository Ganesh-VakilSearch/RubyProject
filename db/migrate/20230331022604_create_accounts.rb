class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :accno
      t.string :accname
      t.string :accadd

      t.timestamps
    end
  end
end
