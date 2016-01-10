class BaseInfo < ActiveRecord::Base


  def location

    "#{province} #{city} #{area}"
  end
end
