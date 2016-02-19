class Api::Visit < ActiveRecord::Base
  belongs_to :contact
  before_save :set_when
  validates_presence_of :page, :contact

  def set_when
    self.when = Time.new
  end
end
