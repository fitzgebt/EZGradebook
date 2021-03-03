class ChangeAssignmentsStudentsTitle < ActiveRecord::Migration[6.0]
  def change
    rename_table :assignemnts_students, :assignments_students
  end
end
