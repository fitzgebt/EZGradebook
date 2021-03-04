class JoinTableAssignmentsStudents < ActiveRecord::Migration[6.0]
  def change
    create_join_table :assignments, :students do |t|
      t.index [:assignment_id, :student_id]
      t.index [:student_id, :assignment_id]
      t.string :grade
    end
  end
end
