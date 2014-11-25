// In each exercice we will print in the console the result.

var sites = ["Google", "Yahoo", "Facebook", "Microsoft", "Apple"];

// The position of "Microsoft" in the array
console.log( $.inArray("Microsoft", sites) )

// If "LinkedIn" is in the sites array
console.log( $.inArray("LinkedIn", sites) >= 0 )

// The name of the companies each name in one line
$.each(sites,function (index, element){ 
		console.log(element)
})


var pow2 = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024];

// The pow of 2 that is 64
console.log( $.inArray(64, pow2) )

// The first 10 pow of 2
$.each(pow2, function(index, element){
	if( index > 0){
		console.log("2^"+ index+" = " +element)		
	}
})

// Double the value of each element of the array
pow_doubled = $.map(pow2, function(element, index){
	return 2*element
})
console.log(pow_doubled)

// Sum the value of all of numbers of the array
var sum = 0
$.each(pow2, function(index, element){
	sum += element
})
console.log("Suma total: "+sum)

// I want to get the values given by the user but the defalut values in the others
var defaultConfig = {left: 10, top: 20, rigth: 30, bottom: 40};

var myFunction = function (config) {
	$.extend(defaultConfig, config)
	return defaultConfig
};

console.log(myFunction({left: 20, top: 30}));



