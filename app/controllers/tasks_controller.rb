class TasksController < ApplicationController
  def index
    # この時点ではまだ、データベースからデータを取得していない
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    task = Task.new(task_params)
    task.save!
    # flash[:notice] = "タスク「#{task.name}」を登録しました。"
    # redirect_to tasks_url
    # 上記のコードを下記のように書き換えることができる
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
