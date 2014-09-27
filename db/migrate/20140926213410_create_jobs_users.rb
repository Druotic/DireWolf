class CreateJobsUsers < ActiveRecord::Migration
  def change
    create_table :jobs_users, :id => false do |t|
      t.belongs_to :user
      t.belongs_to :job
    end
  end
end
