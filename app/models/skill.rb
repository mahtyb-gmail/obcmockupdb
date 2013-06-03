class Skill < ActiveRecord::Base
  attr_accessible :name
  has_many :requirements
  has_many :projects, :through => :requirements
  has_many :bios
  has_many :profiles, :through => :bios
end
