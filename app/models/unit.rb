class Unit < ApplicationRecord
	has_and_belongs_to_many :courses

	validates :name, :body, :position, presence:true
end
