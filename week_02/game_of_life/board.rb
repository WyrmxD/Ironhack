require './cell.rb'

class Board
	
	def initialize(dimension)
		@dimension = dimension
		reset_board()
	end
	
	def reset_board
		@cells = Array.new(@dimension) { Array.new(@dimension) }
		for x in 0..@dimension-1 do
			for y in 0..@dimension-1 do
				add_cell(x,y,Cell.new(:dead))
			end
		end
	end

	def add_cell(x, y, cell)
		@cells[x][y] = cell
	end

	def get_cell(x, y)
		@cells[x][y]
	end

	def cycle
		@cells.map { |row|
			row.map { | cell |
				cell.status = cell.next_status
			}
		}
	end

	def calc_all_neighbours
		for x in 0..@dimension-1 do
			for y in 0..@dimension-1 do
				cell = get_cell(x,y)
				cell.neighbours = get_cell_neighbours(cell).count()
			end
		end
	end

	def get_cell_neighbours(cell)
		cell_neighbours = []
		top_cell = get_cell(x, y-1)
		left_cell = get_cell(x-1, y)
		right_cell = get_cell(x+1, y)
		bottom_cell = get_cell(x, y+1)

		if( !top_cell.nil? && top_cell.is_alive ) then 
			cell_neighbours.push(top_cell)
		end		
		if( !left_cell.nil? && left_cell.is_alive ) then 
			cell_neighbours.push(left_cell)
		end
		if( !right_cell.nil? && right_cell.is_alive ) then 
			cell_neighbours.push(right_cell)
		end
		if( !bottom_cell.nil? && bottom_cell.is_alive ) then 
			cell_neighbours.push(bottom_cell)
		end
	end

	def to_s
		@cells.join(',')
		for x in 0..@dimension-1 do
			for y in 0..@dimension-1 do
				puts "Cel: #{x},#{y} #{@cells[x][y].status}"
			end
		end
	end
	

end