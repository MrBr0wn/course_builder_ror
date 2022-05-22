class Course < ApplicationRecord
  validates_presence_of :title, :body

  def self.active
    Course.where(active: true)
  end

  def self.inactive
    Course.where(active: false)
  end
end
