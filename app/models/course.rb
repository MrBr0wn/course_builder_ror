class Course < ApplicationRecord
  has_and_belongs_to_many :units

  validates_presence_of :title, :body, :description_text, :price

  def self.active
    Course.where(active: true)
  end

  def self.inactive
    Course.where(active: false)
  end
end
