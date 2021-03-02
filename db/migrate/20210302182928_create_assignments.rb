class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :content
      t.integer :teacher_id
    end
  end
end
