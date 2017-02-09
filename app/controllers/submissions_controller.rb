class SubmissionsController < ApplicationController

#displays all submissions
  def index
    @submissions = Submission.all
  end
#displays single submission and associated params
  def show
    @submission = Submission.find(params[:id])
  end
#initializes new submission, only if user is logged in
  def new
    redirect_to root_path unless @current_user
    @submission = Submission.new
  end
#saves new submission, only if user is logged in
  def create
    redirect_to root_path unless @current_user
    @submission = Submission.create(submission_params)
    flash[:notice] = "submission created"
    redirect_to @submission
  end
#saves edited submission information to database, only if user is logged in
  def update
    redirect_to root_path unless @current_user
    @submission = Submission.find(params[:id])
    @submission.update(submission_params)
    redirect_to @submission
  end
#finds submission by ID, displays edit page if user matches
  def edit
    redirect_to root_path unless @current_user
    @submission = Submission.find(params[:id])
  end
#deletes submission only if user is logged in
  def destroy
    redirect_to root_path unless @current_user
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path
  end

#submission params
  private
  def submission_params
    params.require(:submission).permit(:title, :author, :body)
  end

end
