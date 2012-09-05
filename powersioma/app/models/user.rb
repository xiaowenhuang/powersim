#encoding: utf-8
class User < ActiveRecord::Base
  validates_presence_of    :name
  validates_uniqueness_of  :name
  attr_accessor            :password_confirmation
  validates_confirmation_of  :hashed_password
  validate                   :password_non_blank
 private
   def password_non_blank
     errors.add(:password,"不能为空")if hashed_password.blank?
   end
  
end
