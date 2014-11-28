var CardGame = {};

(function(ns){


	ns.whoWins = function(hand1, hand2){
		var player1_counter = 0;
		var player2_counter = 0;

		if(hand1 == '' || hand2 == ''){ 
			throw 'Error invalid hand';
		}

		for(var i=0, len = hand1.length; i < len; i++ ){
			if(hand2[i] > hand1[i]){
				player2_counter++;
			}else if(hand1[i] > hand2[i]){
				player1_counter++;
			}		
		}

		if(player2_counter > player1_counter){
			return "Player2 wins " + player2_counter +" to " + player1_counter;
		}else if(player1_counter > player2_counter){
			return "Player1 wins " + player1_counter +" to " + player2_counter;
		}else{
			return "Tie";
		}
	};

}(CardGame));

