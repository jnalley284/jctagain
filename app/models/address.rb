class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_accessible :city, :line_1, :line_2,
  								:phone_number,
  								:point_of_contact,
  								:state, :zipcode,:same_as_billing_address

  validates_presence_of :line_1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode

  def full_address
     "#{line_1}, #{line_2}"
  end

  def same_as_billing_address=(value)

  end
end
