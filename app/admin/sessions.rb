ActiveAdmin.register Session do
  index do
    column :date
    column :start_time
    column :end_time
    column :status
    column :description

    default_actions
  end
end
