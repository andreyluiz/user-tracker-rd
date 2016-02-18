class Contact < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  validates_presence_of :key
  validates_uniqueness_of :key
end
