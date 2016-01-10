class AddIsRefusedToInterview < ActiveRecord::Migration
  def change

    add_column :interviews,:is_refused,:boolean ,:default => false
  end
end
