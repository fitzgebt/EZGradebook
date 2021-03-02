class CreateStudentsAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :students_assignments do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.string :grade
    end
  end
end
