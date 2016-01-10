class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer  :resume_id
      t.integer  :user_id
      t.boolean  :is_passed ,default:false
      t.boolean  :is_offered ,default:false
      t.boolean  :is_invited ,default:false
      t.timestamps null: false
    end
  end
end
