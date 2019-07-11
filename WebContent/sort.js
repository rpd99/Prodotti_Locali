function sortDivs(f) {
	var arr = [];
	$('.prodotto').each(function() {
		arr.push($(this));
	});
	
	arr.sort(f);
	
	arr.forEach(function (div, i) {
		div.css("order", i);
	});
}

function sortByName() {
	sortDivs(function(a, b) {
	    return a.find('.nome').text() > b.find('.nome').text();
	});
}

function sortByPrice() {
	sortDivs(function(a, b) {
		var prezzo1 = a.find('.prezzo').text();
		var prezzo2 = b.find('.prezzo').text();
	    prezzo1 = parseFloat(prezzo1.substring(0, prezzo1.length - 1));
	    prezzo2 = parseFloat(prezzo2.substring(0, prezzo2.length - 1));
	    return prezzo1 > prezzo2;
	});
}