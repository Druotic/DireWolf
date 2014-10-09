class Job < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users
  has_one :category

  validate  :valid_date_format?
  validates :owner_id, :title, :description, :category_id, :deadline,  presence: true

  # nil should be returned from controller if improperly formatted
  # Add to errors list if so
  def valid_date_format?
    if deadline.nil?
      errors.add(:deadline, "is invalid")
    end
  end
end