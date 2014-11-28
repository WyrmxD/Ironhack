describe("Extract emails", function() {

	it("must return empty array when emails list is empty", function () {
		expect(MyMail.extractEmails([])).toEqual([])
	});

	it("must return empty array when the list is the empty string", function () {
		expect(MyMail.extractEmails([""])).toEqual([])
	});

	it("returns the received email", function () {
		expect(MyMail.extractEmails(["email@email.com"])).toEqual(["email@email.com"])
	});

	// asdasdasd.com
	it("returns an empty array when it has no @", function(){
		expect(MyMail.extractEmails(["emailemail.com"])).toEqual([])
	});

});

