class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    redirect_to resume_path(current_user.resume.id)
  end
  
end
