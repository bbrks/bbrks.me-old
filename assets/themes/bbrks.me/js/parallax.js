window.onscroll = function() {
	var speed = 4.0;
	var elems = document.getElementsByClassName('parallax');
	for (var i = elems.length - 1; i >= 0; i--) {
		elems[i].style.backgroundPosition = "50%" + (-window.pageYOffset / speed) + "px";
	};
}
