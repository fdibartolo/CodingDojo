class AddStatusToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :status, :string
  end
end
