class Customer < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :email, uniqueness: true
end