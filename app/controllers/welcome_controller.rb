class WelcomeController < ApplicationController



  def index
    @body_class="welcome"
    @html_class="html_welcome"
    @foot_class="foot_welcome"
  end
end
