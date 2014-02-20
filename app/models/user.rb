class User < ActiveRecord::Base

  # Association with Photo model
  has_many :photos

  # Comments
  has_many :comments

  # User authentication
  has_secure_password

  # Avatar
  has_attached_file :avatar, :styles => { :thumbnail => "300x300#" }

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :username, :presence => true

  def name
    "#{first_name} #{last_name}"
  end

end
