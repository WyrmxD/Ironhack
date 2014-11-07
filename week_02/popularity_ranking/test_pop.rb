require_relative './poi.rb'
require_relative './fivesquare.rb'
require_relative './sorting_list.rb'
require_relative './criteria.rb'

RSpec.describe "Fivesquare Class Test:" do

	let(:ihack_point) { Poi.new("Ironhack", "Calle Colegiata 9") }
	let(:zoo_point) { Poi.new("El Zoo aa", "Carretera de el Pardo o por ahi") }
	let(:flowers_point) { Poi.new("El Flowers aaa", "Calle de la Latina") }
	let(:sorting_list) { SortingList.new() }
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
		proc_by_visits = proc { |param| param.sort{ |x,y| y.visits <=> x.visits } }
		sorting_list.add_criteria(:by_visits, proc_by_visits)
		
		points_list = fsquare.sort_by(:by_visits)
		expect(points_list).to eq([flowers_point, zoo_point, ihack_point])
	end

	it "check sorting by num a's" do
		proc_by_as = proc { |param| param.sort{ |x,y| 
				y_as = y.name.downcase.scan('a').size 
				x_as = x.name.downcase.scan('a').size 
				y_as <=> x_as
			} 
		}
		sorting_list.add_criteria(:by_as, proc_by_as)
		
		points_list = fsquare.sort_by(:by_as)
		expect(points_list).to eq([flowers_point, zoo_point, ihack_point])
	end

	it "check sorting by comments amount" do 
		fsquare_comm = Fivesquare.new(sorting_list)
		proc_by_comm = proc { |param| param.sort{ |x,y| y.num_comments <=> x.num_comments } }
		sorting_list.add_criteria(:by_comments, proc_by_comm)

		st_poi_1 = object_double(Poi.new("7", "123"), :num_comments => 7)
		st_poi_2 = object_double(Poi.new("3", "123"), :num_comments => 3)
		st_poi_3 = object_double(Poi.new("2", "123"), :num_comments => 2)

		fsquare_comm.add_point(st_poi_1)
		fsquare_comm.add_point(st_poi_2)
		fsquare_comm.add_point(st_poi_3)
		
		points_list = fsquare_comm.sort_by(:by_comments)
		expect(points_list).to eq([st_poi_1, st_poi_2, st_poi_3])
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
