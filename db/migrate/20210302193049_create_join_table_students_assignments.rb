class CreateJoinTableStudentsAssignments < ActiveRecord::Migration[6.0]
  def change
    create_join_table :assignemnts, :students do |t|
      t.index [:assignment_id, :student_id]
      t.index [:student_id, :assignment_id]
    end
  end
end
