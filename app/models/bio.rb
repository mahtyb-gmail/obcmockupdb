class Bio < ActiveRecord::Base
  attr_accessible :profile_id, :skill_id
  belongs_to :profile
  belongs_to :skill
end
