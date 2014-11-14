var orderby = function(object_list, field, order) {
	order = (order === undefined)? 'ASC' : order

	ordered_list = object_list.sort(function(obj1, obj2) {
		if(order === 'ASC'){
			return obj1[field] > obj2[field];
		} else {
			return obj1[field] < obj2[field];
		}	
	});
	return ordered_list
}
