function ricerca() {
	var result = document.getElementById('result');
	var str = document.getElementById('search').value;
	
	if (str.length == 0) {
		// rimuove elementi <option> (suggerimenti) esistenti
		result.innerHTML = '';
		return;
	}
	
	var xmlHttpReq = new XMLHttpRequest();
	xmlHttpReq.responseType = 'json';
	xmlHttpReq.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			// rimuove elementi <option> (suggerimenti) esistenti
			result.innerHTML = '';

			for (i=0; i<this.response.length; i=i+2) {
				var a = document.createElement("a");
				var nome = this.response[i];
				
				var p = document.createElement("p");
				p.innerHTML = nome;
				a.appendChild(p);
				a.href = "./prodotto.jsp?cod=" + this.response[i+1];
				result.appendChild(a);				
			}
		}
	}
	xmlHttpReq.open("GET", "RicercaAjax?keyword=" + str, true);
	xmlHttpReq.send();
}