class TasksController < ApplicationController
  def index
    # この時点ではまだ、データベースからデータを取得していない
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id]) # 既存のタスクを取得
    task.update!(task_params) # 既存のタスクの属性を更新
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
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
