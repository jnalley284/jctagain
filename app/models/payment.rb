class Payment < ActiveRecord::Base
  belongs_to :project
  attr_accessible :stripe_customer_token
end
