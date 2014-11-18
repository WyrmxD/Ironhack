class EntriesController < ApplicationController
	
	def index
		@project = Project.find_by id: params[:project_id]
		year = Time.now.year
		month = Time.now.month
		@total_hours = @project.total_hours_in_month(month, year)
		@entries = @project.entries_of_month(month, year)
	end
end
