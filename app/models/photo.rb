class Photo < ActiveRecord::Base
  # Association with User model
  belongs_to :user

  # Comments
  has_many :comments

  # Validation
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true

  # Paperclip
  has_attached_file :photo, :styles => { :large => "1280x1280>", :thumbnail => "640x640#" }
  validates_attachment :photo, :presence => true
end
