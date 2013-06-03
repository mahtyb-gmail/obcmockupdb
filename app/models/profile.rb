class Profile < ActiveRecord::Base
  attr_accessible :about_me, :location, :name, :title, :user_id, :skill_ids
  validates :name, :title, presence: true
  
  belongs_to :user
  has_many :bios
  has_many :skills, :through => :bios
end
