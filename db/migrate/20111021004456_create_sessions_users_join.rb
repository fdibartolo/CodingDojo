class CreateSessionsUsersJoin < ActiveRecord::Migration
  def up
    create_table 'sessions_users', :id => false do |t|
      t.column 'session_id', :integer
      t.column 'user_id', :integer
    end
  end

  def down
    drop_table 'sessions_users'
  end
end
