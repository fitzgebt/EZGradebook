class AddPrimaryKeyAssignmentsStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments_students, :id, :primary_key
  end
end
