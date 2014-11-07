require_relative './poi.rb'
require_relative './fivesquare.rb'
require_relative './sorting_list.rb'
require_relative './criteria.rb'

RSpec.describe "Fivesquare Class Test:" do
		
	let(:ihack_point) { Poi.new("Ironhack", "Calle Colegiata 9") }
	let(:zoo_point) { Poi.new("El Zoo", "Carretera de el Pardo o por ahi") }
	let(:flowers_point) { Poi.new("El Flowers", "Calle de la Latina") }
	let(:sorting_list) {
		proc_by_visits = proc { |param| param.sort{ |x,y| y.visits <=> x.visits } }
		crit_by_visits = Criteria.new(:by_visits, proc_by_visits)
		proc_by_as = proc { |param| param.sort{ |x,y| 
				y_as = y.name.downcase.scan('a').size 
				x_as = x.name.downcase.scan('a').size 
				y_as <=> x_as
			} 
		}
		crit_by_as = Criteria.new(:by_as, proc_by_as)
		sorting_list = SortingList.new()
		sorting_list.add_criteria(crit_by_visits)
		sorting_list.add_criteria(crit_by_as)
		sorting_list
	}
	let(:fsquare) {
		fsquare = Fivesquare.new(sorting_list)
		flowers_point.add_visit(3)
		ihack_point.add_visit(1)
		zoo_point.add_visit(2)
		fsquare.add_point(flowers_point)
		fsquare.add_point(ihack_point)
		fsquare.add_point(zoo_point)
		fsquare
	}

	it "check sorting by number of visits" do
		points_list = fsquare.sort_by(:by_visits)
		for i in 0..points_list.size-1
			for j in i+1..points_list.size-1
				expect(points_list[i].visits).to be>=(points_list[j].visits)
			end
		end
	end

	it "check sorting by num a's" do
		points_list = fsquare.sort_by(:by_as)
		for i in 0..points_list.size-1
			for j in i+1..points_list.size-1
				i_as = points_list[i].name.downcase.scan('a').size
				j_as = points_list[j].name.downcase.scan('a').size
				expect(i_as).to be>=(j_as)
			end
		end
	end


end

RSpec.describe "POI Class Test:" do
		
	let(:ihack_point) { Poi.new("Ironhack", "Calle Colegiata 9") }

	it "check visit increased" do		
		old_visits = ihack_point.visits
		ihack_point.add_visit()
		expect(ihack_point.visits).to eq(old_visits + 1)
	end
end
