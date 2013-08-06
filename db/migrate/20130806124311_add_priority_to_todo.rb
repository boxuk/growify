class AddPriorityToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :priority, :string
  end
end
