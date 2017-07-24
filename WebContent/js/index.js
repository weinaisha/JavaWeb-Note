window.onload = function() {

	var container = document.getElementById("container");
	var image_list = document.getElementById("image_list");
	var message_list = document.getElementById("message_list");
	var buttons = document.getElementById("buttons").getElementsByTagName("span");
	var prev = document.getElementById("prev");
	var next = document.getElementById("next");
	var index = 1;
	var animated = false;
	var timer;

	function showButton() {
		for(var i = 0; i < buttons.length; i++) {
			if(buttons[i].className == "on") {
				buttons[i].className = "";
				break;
			}
		}
		buttons[index - 1].className = "on";
	}

	function animate(offset) {
		animated = true;
		var newLeft = parseInt(image_list.style.left) + offset;
		var time = 335;	//位移总时间
		var interval = 10;	//每次位移间隔时间
		var distance = offset / (time / interval);	//每次位移距离

		go();
		function go() {
			if((distance < 0 && parseInt(image_list.style.left) > newLeft) || (distance > 0 && parseInt(image_list.style.left) < newLeft)) {
				image_list.style.left = parseInt(image_list.style.left) + distance + "px";
				message_list.style.left = parseInt(message_list.style.left) + distance + "px";
				setTimeout(go,interval);
			} else {
				animated = false;
				image_list.style.left = newLeft + "px";
				message_list.style.left = newLeft + "px";
				if(newLeft > -670) {
					image_list.style.left = "-3350px";
					message_list.style.left = "-3350px";
				}
				if(newLeft < -3350) {
					image_list.style.left = "-670px";
					message_list.style.left = "-670px";
				}
			}
		}
	}

	function play() {
		timer = setInterval(function() {
			next.onclick();
		}, 5000);
	}

	function stop() {
		clearInterval(timer);
	}

	next.onclick = function() {
		if(index == 5)
			index = 1;
		else
			index++;
		showButton();
		if(!animated)
			animate(-670);
	}

	prev.onclick = function() {
		if(index == 1)
			index = 5;
		else
			index--;
		showButton();
		if (!animated) {}
			animate(670);
	}

	for(var i = 0; i < buttons.length; i++) {
		buttons[i].onclick = function() {
			if(this.className == "on")
				return;
			var myIndex = parseInt(this.getAttribute("index"));
			var offset = (myIndex - index) * -670; 
			index = myIndex;
			showButton();
			if(!animated)
				animate(offset);
		}
	}

	container.onmouseover = stop;
	container.onmouseout = play;

	play();

}