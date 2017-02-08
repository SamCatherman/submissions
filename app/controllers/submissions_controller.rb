class SubmissionsController < ApplicationController
  before_action :set_session

  def set_session
    session[:history] ||=[]
  end

  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    session[:history].push(@submission.body)
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submission_params)
    flash[:notice] = "submission created"
    redirect_to @submission
  end

  def update
    @submission = Submission.find(params[:id])
    @submission.update(submission_params)
    redirect_to @submission
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :author, :body)
  end

end
