class Project < ActiveRecord::Base
  attr_accessible :details, :hometown, :length, :name, :project_type, :schedule_info, :startdate, :skill_ids
  validates :name, presence: true
  
  belongs_to :user
  has_many :requirements
  has_many :skills, :through => :requirements
end
