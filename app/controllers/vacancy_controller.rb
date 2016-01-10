class VacancyController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user! ,:only => [:search,:sub_resume]

  def index

    @hotjob=Job.find_by_sql("select * from jobs where id < 3")

    @goodjob=Job.find [1,3,5,6]
    @jobs =Job.all.page params[:page]

  end

  def show
    @hotjob=Job.find_by_sql("select * from jobs where id < 3")

    @goodjob=Job.find [1,3,5,6]
    @job= Job.find_by_id(params[:id])

  end

  def sub_resume

     @interview= Interview.new(:resume_id => params[:resume_id],:user_id => current_user.id )

     @interview.save

    return render :json => {:message => "success"}

  end

  def search

      # Job.import
    @hotjob=Job.find_by_sql("select * from jobs where id < 3")

    @goodjob=Job.find [1,3,5,6]



    location= params[:tagsinput]

    degree= params[:degree]

    if !location.blank?

      if location.include?"全部"

        location=""

      else
        location["[object Object],"]=""
        puts location

      end

    end

    if  degree == "不限"

      degree =""

    end


    if(params[:search]).nil?|| params[:search]==""

      @jobs=Job.all.page params[:page]

      return render "vacancy/index"

    else


      @jobs =Job.search(params[:search],location,degree).page(params[:page]).results

      return render "vacancy/index"

    end

  end

end
