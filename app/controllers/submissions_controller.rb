class SubmissionsController < ApplicationController


  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    redirect_to root_path unless @current_user
    @submission = Submission.new
  end

  def create
    redirect_to root_path unless @current_user
    @submission = Submission.create(submission_params)
    flash[:notice] = "submission created"
    redirect_to @submission
  end

  def update
    redirect_to root_path unless @current_user
    @submission = Submission.find(params[:id])
    @submission.update(submission_params)
    redirect_to @submission
  end

  def edit
    redirect_to root_path unless @current_user
    @submission = Submission.find(params[:id])
  end

  def destroy
    redirect_to root_path unless @current_user
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :author, :body)
  end

end
