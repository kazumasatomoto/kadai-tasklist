class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def show
       @task = Task.find(params[:id])
  end

  def new
      @task = Task.find.new
  end

  def create
      @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash[:danger] = 'タスクが正常に投稿されませんでした'
      render :new
    end
  end

  def edit
      @task = Task.find(params[:id])
  end

  def update
      @task = Task.find(params[:id])

     if @task.update(task_params)
      flash[:success] = 'タスクが正常に編集されました'
      redirect_to @task
     else
      flash.now[:danger] = 'タスクが編集されませんでした'
      render :new
     end
  end

  def destroy
      @task = Task.find(params[:id])
      @task.destroy

      flash[:success] = 'タスクが正常に削除されました'
      redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end