class CompanyController < ApplicationController

before_action :authenticate_company!

  def index


    @interview = Interview.where(:company_id => current_company.id)



  end

end
