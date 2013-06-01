class Skill < ActiveRecord::Base
  attr_accessible :name
  has_many :requirements
  has_many :projects, :through => :requirements
end
