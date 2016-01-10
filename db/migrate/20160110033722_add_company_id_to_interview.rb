class AddCompanyIdToInterview < ActiveRecord::Migration
  def change

    add_column :interviews,:company_id,:integer
  end
end
