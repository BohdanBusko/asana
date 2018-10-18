class Account::TasksController < Account::AccountController
  before_action :set_project
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @project.tasks
  end

  def show
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(tasks_params)
    if @task.save
      redirect_to account_project_tasks_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      redirect_to account_project_tasks_path
    else
      render "edit"
    end
  end

  def destroy
    @task.destroy
    redirect_to account_project_tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :description)
  end

  def find_task
    @task = Project.tasks.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
