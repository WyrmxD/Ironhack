class Project < ActiveRecord::Base

	has_many :entries

	def self.iron_find(id)
		where("id = ?", id).first!
	end

	def self.give_me_a_name(name)
		rows = where("name LIKE ? OR name LIKE ?", name+'-%', name).count
		if (rows == 0) 
			return name 
		else 
			return "#{name}-"+ (rows + 1).to_s
		end
	end

	def self.batch_delete(name_list)
		counter = 0
		where({name: name_list}).each do |project|
			project.destroy
			counter += 1
		end
		counter
	end

	def upcase_name!
		name.upcase!
		self.save
	end

	def self.last_created_projects(n)
		limit(n).order(created_at: :desc)
	end

	def total_hours_in_month(month, year)
		start_date = Date.new(year, month)
		end_date = Date.new(year, month).end_of_month
		entries = self.entries_of_month(month, year)
		entries.reduce(0) do | sum , entry | 
			sum += (entry.hours + entry.minutes / 60)
		end
	end

	def entries_of_month(month, year)
		start_date = Date.new(year, month)
		end_date = Date.new(year, month).end_of_month
		self.entries.where("project_id = ? AND date >= ? AND date <= ?", self.id, start_date, end_date)
	end

end
