function average(data){
	sum = 0
	for (var i = 0, len = data.length; i < len; i++) { 
    	sum += data[i];
	}
	if( sum > 0){
		return sum / i;	
	}
	return 0;
}

function max(data){
	var max = Number.MIN_VALUE;
	for (var i = 0, len = data.length; i < len; i++) { 
    	max = (data[i] > max)? data[i] : max;
	}
	return max;
}

function min(){
	var min = Number.MAX_VALUE;
	for (var i = 0, len = arguments.length; i < len; i++) { 
    	min = (arguments[i] < min)? arguments[i] : min;
	}
	return min;
}