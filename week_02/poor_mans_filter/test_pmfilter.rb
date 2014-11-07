
require_relative './spamfilter.rb'
require_relative './comment.rb'

RSpec.describe "Poor Man's Spam Filter:" do

	let(:user_list) { ['Iñaki','Edu','Quino','Rubén'] }
	let(:spfilter) { Spamfilter.new(user_list) }

	it "if correct comment don't mark as spam" do
		empty_comment = instance_double('Comment', :content => "")
		filter_res = spfilter.is_spam?(empty_comment.content)
		expect(filter_res).not_to be_truthy
	end

	it "if wrong comment mark as spam" do
		spam_comment = instance_double('Comment', :content => "http:// http://")
		filter_res = spfilter.is_spam?(spam_comment.content)
		expect(filter_res).to be_truthy
	end

	it "receive array of comments and mark spam comments" do
		comment = Comment.new("Iñaki", 'contenido')
		comment_list = [comment] * 4
		spam_comment = Comment.new("Fulano",'http:// http://')
		comment_list.push(spam_comment)

		spfilter.mark_spam_list(comment_list)
		expect(comment_list[4].is_spam).to be_truthy

	end

	it "check trusted users comments allowed to write links" do
		comment = Comment.new('Edu', 'http:// http://')
		comment_list = []
		comment_list.push(comment)
		spfilter.mark_spam_list(comment_list)
		expect(comment_list[0].is_spam).not_to be_truthy		
	end


# 	let(:ihack_point) { Poi.new("Ironhack", "Calle Colegiata 9") }
# 	let(:zoo_point) { Poi.new("El Zoo", "Carretera de el Pardo o por ahi") }
# 	let(:flowers_point) { Poi.new("El Flowers", "Calle de la Latina") }
# 	let(:sorting_list) { SortingList.new() }
# 	let(:fsquare) {
# 		fsquare = Fivesquare.new(sorting_list)
# 		flowers_point.add_visit(3)
# 		ihack_point.add_visit(1)
# 		zoo_point.add_visit(2)
# 		fsquare.add_point(flowers_point)
# 		fsquare.add_point(ihack_point)
# 		fsquare.add_point(zoo_point)
# 		fsquare
# 	}

# 	it "check sorting by number of visits" do
# 		proc_by_visits = proc { |param| param.sort{ |x,y| y.visits <=> x.visits } }
# 		crit_by_visits = Criteria.new(:by_visits, proc_by_visits)
# 		sorting_list.add_criteria(crit_by_visits)
		
# 		points_list = fsquare.sort_by(:by_visits)
# 		for i in 0..points_list.size-1
# 			for j in i+1..points_list.size-1
# 				expect(points_list[i].visits).to be>=(points_list[j].visits)
# 			end
# 		end
# 	end

# 	it "check sorting by num a's" do
# 		proc_by_as = proc { |param| param.sort{ |x,y| 
# 				y_as = y.name.downcase.scan('a').size 
# 				x_as = x.name.downcase.scan('a').size 
# 				y_as <=> x_as
# 			} 
# 		}
# 		crit_by_as = Criteria.new(:by_as, proc_by_as)
# 		sorting_list.add_criteria(crit_by_as)
		
# 		points_list = fsquare.sort_by(:by_as)
# 		for i in 0..points_list.size-1
# 			for j in i+1..points_list.size-1
# 				i_as = points_list[i].name.downcase.scan('a').size
# 				j_as = points_list[j].name.downcase.scan('a').size
# 				expect(i_as).to be>=(j_as)
# 			end
# 		end
# 	end

# 	it "check sorting by comments amount" do 
# 		fsquare_comm = Fivesquare.new(sorting_list)
# 		proc_by_comm = proc { |param| param.sort{ |x,y| y.num_comments <=> x.num_comments } }
# 		crit_by_comm = Criteria.new(:by_comments, proc_by_comm)
# 		sorting_list.add_criteria(crit_by_comm)

# 		st_poi_1 = object_double(Poi.new("7", "123"), :num_comments => 7)
# 		st_poi_2 = object_double(Poi.new("3", "123"), :num_comments => 3)
# 		st_poi_3 = object_double(Poi.new("2", "123"), :num_comments => 2)

# 		fsquare_comm.add_point(st_poi_1)
# 		fsquare_comm.add_point(st_poi_2)
# 		fsquare_comm.add_point(st_poi_3)
		
# 		points_list = fsquare_comm.sort_by(:by_comments)
# 		for i in 0..points_list.size-1
# 			for j in i+1..points_list.size-1
# 				i_comm = points_list[i].num_comments
# 				j_comm = points_list[j].num_comments
# 				expect(i_comm).to be>=(j_comm)
# 			end
# 		end
# 	end 

end

# RSpec.describe "POI Class Test:" do
		
# 	let(:ihack_point) { Poi.new("Ironhack", "Calle Colegiata 9") }

# 	it "check visit increased" do		
# 		old_visits = ihack_point.visits
# 		ihack_point.add_visit()
# 		expect(ihack_point.visits).to eq(old_visits + 1)
# 	end
# end
