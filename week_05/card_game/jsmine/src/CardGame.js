var CardGame = {};

(function(ns){


	ns.whoWins = function(hand1, hand2){
		var score1 = 0;
		var score2 = 0;

		if(hand1 == '' || hand2 == ''){ 
			throw 'Error invalid hand';
		}

		for(var i=0, len = hand1.length; i < len; i++ ){
			if(hand2[i] > hand1[i]){
				score2++;
			}else if(hand1[i] > hand2[i]){
				score1++;
			}		
		}

		return displayScore(score1, score2);

		
	};

	var displayScore = function(score1, score2){
		if(score2 > score1){
			return "Player2 wins " + score2 +" to " + score1;
		}else if(score1 > score2){
			return "Player1 wins " + score1 +" to " + score2;
		}else{
			return "Tie";
		} 
	}

}(CardGame));

