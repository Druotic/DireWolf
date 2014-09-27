class UsersSkills < ActiveRecord::Migration
  def up
    create_table :users_skills, :id=>false do |t|
      t.integer :user_id
      t.integer :skill_id
    end
  end
  def down
    drop table :users_skills
  end
end
