class CreateUses < ActiveRecord::Migration[7.0]
  def change
    create_table :uses do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
