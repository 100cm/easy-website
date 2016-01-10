class WelcomeController < ApplicationController

  before_action :switch_template!, :only => [:index]

  def index
    @body_class="welcome"
    @html_class="html_welcome"
    @foot_class="foot_welcome"

    @jingying =Job.find_by_sql("select * from jobs where job like  '%经理'  limit 0, 5")

    @mishu = Job.find_by_sql("select * from jobs where job like  '%秘书'  limit 0, 5")

    @kaifa =Job.find_by_sql("select * from jobs where job like  '%开发'  limit 0, 5")


  end

  def switch_template!
    if  user_signed_in?
      return redirect_to "/vacancy"

    elsif company_signed_in?

      return redirect_to "/company"

    else

      return index

    end
  end
end
