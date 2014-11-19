module ProjectsHelper
	def total_hours
		@project.total_hours_in_month(Time.now.month, Time.now.year)
	end
end
