class Category < ActiveRecord::Base
  has_many :jobs
  # Add min length requirement as well, empty string was sometimes stored
  validates :name, presence: true, length: { minimum: 1 }
end