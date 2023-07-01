class TasksController < ApplicationController
  def index
    # この時点ではまだ、データベースからデータを取得していない
    @tasks = current_user.tasks
    # @tasks = Task.where(user_id: current_user.id)
  end

  def show
    # @task = Task.find(params[:id])
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      # flash[:notice] = "タスク「#{task.name}」を登録しました。"
      # redirect_to tasks_url
      # 上記のコードを下記のように書き換えることができる
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      # エラーの場合は、newアクションを実行する
      render :new
    end

    # @task = current_user.tasks.new(task_params)

    # if @task.save
    #   redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    # else
    #   render :new
    # end
  end

  def edit
    # @task = Task.find(params[:id])
    @task = current_user.tasks.find(params[:id])
  end

  def update
    # task = Task.find(params[:id]) # 既存のタスクを取得
    task = current_user.tasks.find(params[:id])
    task.update!(task_params) # 既存のタスクの属性を更新
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    # task = Task.find(params[:id]) # 既存のタスクを取得
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
