class Account::ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.projects.all
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to account_user_path(@current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to account_user_path(@current_user)
    else
      render :edit
    end
  end

  def show
    @project = current_user.projects.find(project_params)
  end

  def destroy
    @project.delete
    redirect_to account_user_path(@current_user)
  end


  private

  def project_params
    params.require(:project).permit( :name)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
