class EntriesController < ApplicationController
	
	def index
		@project = Project.find_by id: params[:project_id]
		year = Time.now.year
		month = Time.now.month
		@entry = @project.entries_of_month(month, year)
	end

	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end

	def create
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new(entry_params)

		if @entry.save
			flash[:notice] = "entry created OK!"
			redirect_to project_entries_path(@project)
		else
			flash.now[:error] = "The entry couldn't be created"
			render 'new'
		end
	end
    
    def edit
    	@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
    end

    def update
    	@project = Project.find params[:project_id]
    	@entry = @project.entries.find params[:id]

    	if @entry.update_attributes(entry_params)
			flash[:notice] = "entry updated OK!"
			redirect_to project_entries_path(@project)
		else
			flash.now[:error] = "The entry couldn't be created"
			render 'edit'
		end
    end

	private
	def entry_params
		params.require(:entry).permit(:hours, :minutes, :comment, :date)
    end


end
