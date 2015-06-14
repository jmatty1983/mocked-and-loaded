class Pick < ActiveRecord::Base
  belongs_to :mock
  belongs_to :player
end
