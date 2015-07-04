class Team < ActiveRecord::Base
  belongs_to :mock
  has_many :picks
end
