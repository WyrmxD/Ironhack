require './cell.rb'
require './board.rb'

RSpec.describe "Game of Life" do

	let(:alive_cell) { Cell.new(:alive) }
	let(:dead_cell) { Cell.new(:dead) }
	let(:board) { Board.new(2) }

	it "has to die" do
		expect( alive_cell.next_status() ).to eq(:dead)
	end

	it "has to birth" do
		dead_cell.neighbours = 3
		expect( dead_cell.next_status() ).to eq(:alive)
	end

	it "every cell is dead but one" do
		cell = Cell.new(:alive)
		board.add_cell(1, 1, cell)
		board.cycle
		next_day_cell = board.get_cell(1,1)
		expect( next_day_cell.status ).to eq(:dead)
	end

	it "rebirth cell" do
		board = Board.new(3)
		cell = Cell.new(:alive)
		dead_cell = Cell.new(:dead)
		
		board.add_cell(0,1,cell)
		board.add_cell(1,0,cell)
		board.add_cell(1,1,dead_cell)
		board.add_cell(1,2,cell)
		puts board.to_s
		board.cycle
		next_day_cell = board.get_cell(1,1)
		puts "Celula #{next_day_cell.status}"
		expect( next_day_cell.status ).to eq(:alive)
	end

end
