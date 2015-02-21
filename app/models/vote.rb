class Vote < ActiveRecord::Base
	validates :name, presence: true, length: { 12 }
	validates :description, presence: true, length: { maximum: 5 }
end
