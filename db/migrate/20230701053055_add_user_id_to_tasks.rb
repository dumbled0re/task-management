class AddUserIdToTasks < ActiveRecord::Migration[7.0]
  # tasksテーブルにuser_idカラムを追加する
  def up
    # tasksテーブルの全てのレコードを削除する
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end
end
