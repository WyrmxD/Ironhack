class ProjectsController < ApplicationController
  
	def index
		@projects = Project.last_created_projects(10)
		if @projects.empty? 
			render 'no_projects_found', layout: 'no_project'
		end
	end

	def show
		# render 'no_projects_found' unless (@project = Project.find_by id: params[:id].to_i)
		name = params[:name]
		projects = Project.select("id, name")
		sanitized_projects = {}
		projects.each do | project |
			sanitized_projects[project.name.parameterize] = project.id
		end
		id = sanitized_projects[name]
		@project = Project.find_by id: id.to_i
	end 

end
