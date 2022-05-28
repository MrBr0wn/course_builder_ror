class Course < ApplicationRecord
  has_and_belongs_to_many :units

  validates_presence_of :title, :body, :description_text, :price
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  def self.active
    Course.where(active: true)
  end

  def self.inactive
    Course.where(active: false)
  end
end
