class Pharmacy < ActiveRecord::Base
  validates_presence_of :name,:reason
end
