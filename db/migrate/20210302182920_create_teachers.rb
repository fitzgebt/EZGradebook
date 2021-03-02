class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.string :password_digest
    end
  end
end
