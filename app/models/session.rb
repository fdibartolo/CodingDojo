class Session < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  accepts_nested_attributes_for :users, :allow_destroy => true
  
  def self.get_upcoming_open_session
    where(:status => "Open").order("date ASC").first
  end
end
