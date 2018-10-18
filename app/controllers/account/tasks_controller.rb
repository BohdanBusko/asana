class Account::TasksController < Account::AccountController
  before_action :set_project_and_section
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @task = @section.tasks.new
  end

  def create
    @task = @section.tasks.new(tasks_params)

    if @task.save
      redirect_to account_project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      redirect_to account_project_path(@project)
    else
      render "edit"
    end
  end

  def destroy
    @task.destroy
    redirect_to account_project_path(@project)
  end

  private

  def set_project_and_section
    @project = current_user.projects.find(params[:project_id])
    @section = @project.sections.find(params[:section_id])
  end

  def tasks_params
    params.require(:task).permit(:title, :description)
  end

  def set_task
    @task = @section.tasks.find(params[:id])
  end
end
