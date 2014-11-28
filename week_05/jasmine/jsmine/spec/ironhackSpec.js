describe("Some functions", function() {

	it("calculate the average", function() {
		expect(average([3,3,3])).toEqual(3);
		expect(average([3,7])).toEqual(5);
	});

	it("calculate the maximun", function() {
		expect(max([3,6,-8])).toEqual(6);
		expect(max([3,6,-8])).toEqual(6);
	});

	it("calculate the minimum", function() {
		expect(min(3,-8,6)).toEqual(-8);
		//expect(min(3,6,8)).toEqual(3);
	});

});