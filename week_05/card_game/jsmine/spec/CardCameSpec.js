describe("My card game", function() {

	it("calculate the average", function() {
		expect(average([3,3,3])).toEqual(3);
		expect(average([3,7])).toEqual(5);
	});

});