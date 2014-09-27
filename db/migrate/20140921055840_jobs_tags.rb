class JobsTags < ActiveRecord::Migration
  def up
    create_table :jobs_tags, :id=>false do |t|
      t.integer :job_id
      t.integer :tag_id
    end
  end
  def down
    drop table :jobs_tags
  end
end

