function autocomplete(inp, arr) {

	let currentFocus;

	inp.addEventListener("input", function(e) {
		let a, b, i, val = this.value;
		closeAllLists();
		if (!val) { return false; }
		currentFocus = -1;

		a = document.createElement("DIV");
		a.setAttribute("id", this.id + "autocomplete-list");
		a.setAttribute("class", "autocomplete-items");
		this.parentNode.appendChild(a);
		for (i = 0; i < arr.length; i++) {
			if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
				b = document.createElement("DIV");
				b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
				b.innerHTML += arr[i].substr(val.length);
				b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
				b.addEventListener("click", function(e) {
					//inp.name = this.getElementsByTagName("input")[0].value;
					inp.value = this.getElementsByTagName("input")[0].value;
					closeAllLists();
				});
				a.appendChild(b);
			}
		}
	});

	inp.addEventListener("keydown", function(e) {
		var x = document.getElementById(this.id + "autocomplete-list");
		if (x) x = x.getElementsByTagName("div");
		if (e.keyCode == 40) {
			currentFocus++;
			addActive(x);
		} else if (e.keyCode == 38) { 
			currentFocus--;
			addActive(x);
		} else if (e.keyCode == 13) {
			e.preventDefault();
			if (currentFocus > -1) {
				if (x) x[currentFocus].click();
			}
		}
	});
	function addActive(x) {
		if (!x) return false;
		removeActive(x);
		if (currentFocus >= x.length) currentFocus = 0;
		if (currentFocus < 0) currentFocus = (x.length - 1);
		x[currentFocus].classList.add("autocomplete-active");
	}
	function removeActive(x) {
		for (var i = 0; i < x.length; i++) {
			x[i].classList.remove("autocomplete-active");
		}
	}
	function closeAllLists(elmnt) {
		var x = document.getElementsByClassName("autocomplete-items");
		for (var i = 0; i < x.length; i++) {
			if (elmnt != x[i] && elmnt != inp) {
				x[i].parentNode.removeChild(x[i]);
			}
		}
	}
	
	document.addEventListener("click", function(e) {
		closeAllLists(e.target);
	});
}

function setClassification() {
	for (let i = 1; i < 11; i++) {
		let option = document.getElementById("cl"+i);
		let btn = document.getElementById("dropdownMenuButton");
		let inp = document.getElementById("classification");
		
		option.addEventListener("click", function(e) {
			inp.value = option.textContent;
			btn.textContent = "Classification: "+option.textContent;
		});
	}
    
   
 }

function validationComment() {
	let comment = document.getElementById("comment");
	let invalid = document.getElementById("invalid-comment");
	
    if(comment.value.trim().length == 0){
		comment.focus();
        invalid.innerHTML = "The comment can't be blank";
        return false;
	}
   
 }

function validationClassification() {
	let classification = document.getElementById("classification");
	let invalid = document.getElementById("invalid-class");
	
    if(!classification.value || classification.value.length === 0){
		classification.focus();
        invalid.innerHTML = "You must have to enter a value on classification";
        return false;
	}
 }