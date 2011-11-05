class AddActiveAdminUserAndRemoveDefault < ActiveRecord::Migration
  def up
    AdminUser.delete_all
    AdminUser.create!(:email => 'sensei@dojo.com', :password => 'admindojo', :password_confirmation => 'admindojo')
  end

  def down
  end
end
