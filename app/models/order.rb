class Order < ActiveRecord::Base
  has_many :carts
  NUMBER_FORMAT=/\d{11}/
  validates :phonenumber, 
  format: { with: NUMBER_FORMAT, 
    :message => '必须是11位数字'}
end
