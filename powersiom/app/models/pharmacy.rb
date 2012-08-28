class Pharmacy < ActiveRecord::Base
  validates_presence_of :title, :operator, :reason
end
