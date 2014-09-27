class CreateSkills < ActiveRecord::Migration
  def up
    create_table :skills do |t|
      t.string    :name
      t.integer   :users_id
    end
  end

  def down
    drop_tables :skills
  end
end
