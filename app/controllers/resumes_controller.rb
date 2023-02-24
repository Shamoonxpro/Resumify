class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @resume = current_user.build_resume
  end

  def create
    @resume = current_user.build_resume(resume_params)
    if @resume.save
      redirect_to @resume, notice: "Resume created successfully."
    else
      render :new
    end
  end
  def show
    @resume = current_user.resume
    @user = current_user
  end
  def edit
    
  end
  private

  def resume_params
    params.require(:resume).permit(:title, :description,:user_id)
  end
end
