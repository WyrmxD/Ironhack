describe("My card game", function() {

	describe("The highest card game", function(){

		it("may have a winner with a single round", function() {
			 // Player2 wins 1 to 0 
			 expect(CardGame.whoWins(['1'],['2'])).toBe("Player2 wins 1 to 0");
			 // Player 1 wins 1 to 0
			 expect(CardGame.whoWins(['2'],['1'])).toBe("Player1 wins 1 to 0");
		});

		it("may have a tie with a single round", function() {
			expect(CardGame.whoWins(['1'],['1'])).toBe("Tie");
		});

		it("may rise an error with empty card on a single round", function() {
			expect(function(){
				CardGame.whoWins([''],['1'])
			}).toThrow('Invalid game, wrong cards');
			expect(function(){
				CardGame.whoWins(['1'],[''])
			}).toThrow('Invalid game, wrong cards');
			expect(function(){
				CardGame.whoWins([''],[''])
			}).toThrow('Invalid game, wrong cards');
		});

		it("may have a winner with two rounds", function() {
			expect(CardGame.whoWins(['1','1'],['2','2'])).toBe('Player2 wins 2 to 0');
			expect(CardGame.whoWins(['K','K'],['Q','Q'])).toBe('Player1 wins 2 to 0');
		});

		it("may have a tie with two rounds", function() {
			expect(CardGame.whoWins(['1','1'],['1','1'])).toBe('Tie');
		});

		it("may rise an error with empty card on a single round", function() {
			expect(function(){
				CardGame.whoWins(['1',''],['1','1'])
			}).toThrow('Invalid game, wrong cards');
			expect(function(){
				CardGame.whoWins(['1','1'],['1',''])
			}).toThrow('Invalid game, wrong cards');
			expect(function(){
				CardGame.whoWins(['',''],['',''])
			}).toThrow('Invalid game, wrong cards');
		});

		it("may rise an error with different number of cards", function() {
			expect(function(){
				CardGame.whoWins(['1','J'],['1'])
			}).toThrow('Invalid game, wrong cards);
		});




	});

});