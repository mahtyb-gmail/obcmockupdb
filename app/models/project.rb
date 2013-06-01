class Project < ActiveRecord::Base
  attr_accessible :details, :hometown, :length, :name, :project_type, :schedule_info, :startdate
  validates :name, presence: true
  
  belongs_to :user
end
