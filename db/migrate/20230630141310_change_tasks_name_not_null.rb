class ChangeTasksNameNotNull < ActiveRecord::Migration[7.0]
  def change
    # change_column_nullでカラムのnull制約を変更できる(falseでNULLを許可しない)
    change_column_null :tasks, :name, false
  end
end
