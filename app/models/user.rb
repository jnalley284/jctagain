class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :phone, :projects_attributes,
                  :addresses_attributes,:flex_id
  # attr_accessible :title, :body
  # validates :first_name, :last_name, presence: true

  has_many :addresses, dependent: :destroy
  has_many :projects, dependent: :destroy

  accepts_nested_attributes_for :projects
  accepts_nested_attributes_for :addresses

  def full_name
    "#{first_name} #{last_name}"
  end

  def flex_account_name
    "jct-#{id}"
  end

  def confirm!
    super
    ConfirmAccountWorker.perform_async(id)
  end
end
