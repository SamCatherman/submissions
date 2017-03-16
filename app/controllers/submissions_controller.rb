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
    @submission = Submission.new
  end
#saves new submission, only if user is logged in
  def create
    @submission = current_user.submissions.create!(submission_params)
    flash[:notice] = "submission created"
    redirect_to @submission
  end
#saves edited submission information to database, only if user is logged in
  def update
    @submission = Submission.find(params[:id])
    @submission.update(submission_params)
    redirect_to @submission
  end
#finds submission by ID, displays edit page if user matches
  def edit
    # if @submission.user == current_user
      @submission = Submission.find(params[:id])
    # end

  end
#deletes submission only if user is logged in
  def destroy
    @submission = Submission.find(params[:id])
    if @submission.user == current_user
      @submission.destroy
    else
      flash[:alert] = "Only the author of the submission can delete"
    end
    redirect_to submissions_path
  end

#submission params
  private
  def submission_params
    params.require(:submission).permit(:title, :author, :body)
  end

end
