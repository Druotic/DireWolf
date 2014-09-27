class Job < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users
  has_one :category

  validates :owner_id, :title, :description, :category_id, :deadline,  presence: true
end