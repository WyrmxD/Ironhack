class Project < ActiveRecord::Base

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

end
