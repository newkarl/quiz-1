class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    if @job.valid?
      redirect_to jobs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @jobs = Job.all
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end