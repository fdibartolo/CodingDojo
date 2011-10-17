class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :description

      t.timestamps
    end
  end
end
