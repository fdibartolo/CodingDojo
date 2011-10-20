ActiveAdmin.register User do
  index do
    column :first_name
    column :last_name
    column :enterprise_id
    column :email
    column :password_hash

    default_actions
    end
end
