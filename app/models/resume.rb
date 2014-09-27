class Resume < ActiveRecord::Base
  belongs_to :users
  validates :title, :presence => true, :length => {:maximum => 128}
  validates :body, :presence => true, :length => {:maximum => 10000}
  validates :owner_id, :presence => true
end
