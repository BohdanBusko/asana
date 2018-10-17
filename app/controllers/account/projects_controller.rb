class Account::ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects=@curent_user.projects
  end

  def new
    @project=@curent_user.projects.new
  end

  def create
    project=@curent_user.projects.new(project_params)

    if @project.save
      redirect_to account_user_path(@curent_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to account_user_path(@curent_user)
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project.delete
    redirect_to account_user_path(@curent_user)
  end

  end

  private

  def project_params
    params.require(:project).permit( :name)
  end
  
  def set_project
    @project = Project.find(params[:project_id])
  end
end
