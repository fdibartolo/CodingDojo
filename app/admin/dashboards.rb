ActiveAdmin::Dashboards.build do

  section "Upcoming Dojos" do
    table_for Session.where(:status => "Open") do
      column :date do |session|
        link_to session.date.strftime("%A, %B %d %Y"), [:admin, session] #Monday, September 23 2011
      end

      #column "Signed up people so far..." do |session|
      #  #session.users.find_all {|u| u.enterprise_id }
      #  attendees = []
      #  session.users.each do |user|
      #    attendees << user.enterprise_id
      #  end
      #  attendees.to_sentence()
      #end

      column "Signed up people so far..." do |session|
        table_for session.users do
          column do |user|
            user.first_name + " " + user.last_name + " (" + user.enterprise_id + ")"
          end
          column do
            link_to "click to unregister this user!", signup_path
          end
        end
      end
    end
  end

end
