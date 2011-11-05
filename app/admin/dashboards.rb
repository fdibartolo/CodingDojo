ActiveAdmin::Dashboards.build do

  section "Upcoming Dojos" do
    table_for Session.where(:status => "Open") do
      column :date do |session|
        link_to session.date.strftime("%A, %B %d %Y"), [:admin, session] #Monday, September 23
      end

      column :start_time do |session|
        session.start_time.strftime("%H:%M")
      end

      column "Signed up people so far..." do |session|
        #session.users.find_all {|u| u.enterprise_id.length > 1}
        attendees = []
        session.users.each do |user|
          attendees << user.enterprise_id
        end
        attendees.to_s
      end
    end
  end

end
