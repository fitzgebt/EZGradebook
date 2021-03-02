class ReplaceStringWithTextForAssignments < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :content, :string
    add_column :assignments, :content, :text
  end
end
