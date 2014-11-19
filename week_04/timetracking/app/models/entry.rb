class Entry < ActiveRecord::Base
	belongs_to :project
	validates :date , presence: true
	validates :hours, :minutes , numericality: { only_integer: true }
end
