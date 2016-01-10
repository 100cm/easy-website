class InterviewController < ApplicationController

  skip_before_filter :verify_authenticity_token


def index

  @hotjob=Job.find_by_sql("select * from jobs where id < 3")

  @goodjob=Job.find [1,3,5,6]

  @interview = Interview.where(:user_id => current_user.id)


end

  def refuse

    @interview=Interview.find_by_id(params[:id])

    @interview.is_refused=true

    @interview.save


    redirect_to "/resume/show?user_id=#{@interview.user_id}&resume_id=#{@interview.resume_id}"
  end

  def invite

    @interview =Interview.find_by_id(params[:id])

    @interview.is_invited=true


    @interview.save

    redirect_to :controller =>:resume ,:action => :show , :user_id => @interview.user_id,:resume_id => @interview.resume_id

  end


end
