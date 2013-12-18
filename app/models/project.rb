class Project < ActiveRecord::Base
	attr_accessible :name, :due_date, :address_attributes, :payment_attributes,
									:card_token, :name_on_card, :card_number, :card_month, :card_year, :card_cvc
  attr_accessor :name_on_card, :card_number, :card_month, :card_year, :card_cvc

	has_one :address
	has_one :payment
  belongs_to :user
  has_many :statuses

	validate :name, presence: true
  validate :due_date, presence: true

	validates_associated :address
	validates_associated :payment

	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :payment

	scope :completed, -> { where(complete: true) }
	scope :open, 			-> { where(complete: false) }

  def start_date
    due_date.strftime("%m/%d/%Y")
  end

end
