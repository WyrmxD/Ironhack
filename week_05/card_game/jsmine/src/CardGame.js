var CardGame = {};

(function(ns){

	var player1_counter = 0;
	var player2_counter = 0;

	ns.whoWins = function(hand1, hand2){

		if(hand1 == '' || hand2 == ''){ 
			throw 'Error invalid hand';
		}

		if(hand2 > hand1){
			return "Player2 wins 1 to 0";
		}else if(hand1 > hand2){
			return "Player1 wins 1 to 0";
		}else{
			return "Tie";
		}
	};

}(CardGame));

