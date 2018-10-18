class Account::SectionsController < ApplicationController
  before_action :set_project
  before_action :set_section, only: [:edit, :update, :destroy]

  def new
    @section = @project.sections.new
  end

  def create
    @section = @project.sections.new(section_params)

    if @section.save
      redirect_to account_project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @section.update_attributes(section_params)
      redirect_to account_project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @section.delete
    redirect_to account_project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_section
    @section = @project.sections.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name)
  end
end
