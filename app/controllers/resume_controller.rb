class ResumeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index

    @hotjob=Job.find_by_sql("select * from jobs where id < 3")

    @goodjob=Job.find [1,3,5,6]

    @base_info=BaseInfo.find_by_user_id(current_user.id)

    @contact=Contact.find_by_user_id(current_user.id)

    @edu =Education.where(:user_id => current_user.id)


    @exp =Experience.where(:user_id => current_user.id)



  end

  def show


    @base_info=BaseInfo.find_by_user_id(params[:user_id])

    @contact=Contact.find_by_user_id(params[:user_id])

    @edu =Education.where(:user_id => params[:user_id])


    @exp =Experience.where(:user_id => params[:user_id])


    @Interview= Interview.where(:user_id => params[:user_id],:resume_id => params[:resume_id])

    return render 'resume/show'


  end




  def create_base_info

     @base=BaseInfo.find_by_user_id(current_user.id)


     if @base.nil?

       @base=BaseInfo.new base_info_params
       @base.user_id=current_user.id
       @base.province=params[:cho_Province]
       @base.city=params[:cho_City]
       @base.city=params[:cho_Area]
       @base.save
     else

       @base.update(base_info_params)
       @base.update(:province => params[:cho_Province],:city => params[:cho_City],:area=> params[:cho_Area])

     end





    redirect_to  "/resume"

  end

  def create_contact


    @contact=Contact.find_by_user_id(current_user.id)

    if !@contact.nil?

      @contact.update(contact_params)

    else

      @contact=Contact.new contact_params

      @contact.user_id=current_user.id

      @contact.save

    end



  redirect_to "/resume"

  end


  def create_edu



      @edu =Education.new edu_params

      @edu.user_id = current_user.id

      @edu.save


    redirect_to "/resume"

  end

  def edit_edu

    @edu =Education.find_by_id(params[:id])

     return render :json => {:school => @edu.school ,:end_time => @edu.end_time ,:begin_time => @edu.begin_time,
                              :level => @edu.level ,:profession => @edu.profession }

  end

  def update_edu

    @edu = Education.find_by_id(params[:id])


    @edu.update(edu_params)


    redirect_to "/resume"

  end

  def delete_edu

   @edu=Education.find_by_id(params[:id])

   @edu.destroy


    redirect_to "/resume"

  end

  def create_exp
    @exp=Experience.new exp_params

    @exp.user_id=current_user.id

    @exp.save

    redirect_to "/resume"

  end


  def delete_exp

  @exp=Experience.find_by_id(params[:id])

  @exp.destroy


    redirect_to "/resume"


  end
  def edit_exp

    @exp=Experience.find_by_id(params[:id])


    return render :json => {:company => @exp.company, :work => @exp.work, :end_time => @exp.end_time ,:begin_time =>@exp.begin_time,

                            :work_type => @exp.work_type
                  }

  end


  def update_exp

    @exp=Experience.find_by_id(params[:id])

    @exp.update(exp_params)

    redirect_to "/resume"

  end


  def create_avatar




    @user=User.find_by_id(current_user.id)

    User.establish_connection()

    @user.avatar = params[:file]


    @user.save


    redirect_to "/resume"


  end



  protected

  def base_info_params

  params.require(:base_info).permit(:name,:age,:sex,:is_married,:weight,:c_number)

  end

  def contact_params

    params.require(:contact).permit(:home,:phone,:qq,:email,:postalcode)
  end


  def edu_params

    params.require(:education).permit(:school,:level,:end_time,:begin_time,:profession)
  end


  def exp_params
    params.require(:experience).permit(:company,:work,:end_time,:begin_time,:work_type)
  end

end
