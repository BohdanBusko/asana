class Account::ProjectsController < ApplicationController

  def index
    @projects=@curent_user.projects
  end

  def new
    @project=@curent_user.projects.new
  end

  def create
    project=@curent_user.projects.new(project_params)

    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @project=Project.find
  end

  def update
    project=@curent_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to account_projects_path
    else
    render :edit
  end

  def show
      @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to account_projects_path
  end

  end


  def project_params
    params.require(:project).permit( :name)
  end
end
