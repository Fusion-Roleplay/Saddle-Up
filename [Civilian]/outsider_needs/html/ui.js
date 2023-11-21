
function makeDraggable(element, className) {
	element.draggable({
		stop: function (event, ui) {
			var pos = ui.position;
			element.css({
				top: pos.top + "px",
				left: pos.left + "px",
			});
			$.post(
				`https://${GetParentResourceName()}/UIposition`,
				JSON.stringify({
					x: pos.left,
					y: pos.top,
					className: className,
				})
			);
		},
	}).addClass(className);
}

/* 
function makeResizable(element, className) {
	console.log(className)
	element.resizable({
		stop: function (event, ui) {
			var size = {
				width: ui.size.width + "px",
				height: ui.size.height + "px",
			};
			element.css({
				width: size.width,
				height: size.height,
			});
			console.log(size.width, size.height)
			$.post(`https://${GetParentResourceName()}/UIsize`,
				JSON.stringify({
					width: size.width,
					height: size.height,
					className: className,
				})
			);
		}
	}).addClass(className);
}
 */

//close
document.onkeyup = function (data) {
	if (data.key == "Escape") {
		$.post(`https://${GetParentResourceName()}/UIclose`, JSON.stringify({}));
	}
};

window.addEventListener("message", function (event) {
	if (event.data.type === "UIposition") {
		let element = $(`.${event.data.className}`);
		element.css({
			top: event.data.y + "px",
			left: event.data.x + "px",
		});
	}

	/* 	if (event.data.type === "UIsize") {
			let element = $(`.${event.data.className}`);
			element.css({
				width: event.data.width + "px",
				height: event.data.height + "px",
			});
		}
	 */
});


document.addEventListener("DOMContentLoaded", function () {
	document.body.style.display = "none";
	let hunger;
	let thirst;

	makeDraggable($(".temp"), "temp");
	makeDraggable($(".hunger"), "hunger");
	makeDraggable($(".thirst"), "thirst");
	makeDraggable($(".voice"), "voice");
	makeDraggable($(".bath"), "bath");
	makeDraggable($(".health"), "health");
	makeDraggable($(".stamina"), "stamina");
	makeDraggable($(".templocal"), "templocal");
	makeDraggable($(".horseHealth"), "horseHealth");
	makeDraggable($(".horseStamina"), "horseStamina");
	makeDraggable($(".stress"), "stress");
	makeDraggable($(".addiction"), "addiction");
	/* resize*/



	/* it doesnt work with images idk why
	makeResizable($(".temp"), "temp");
		makeResizable($(".hunger"), "hunger");
		makeResizable($(".thirst"), "thirst");
		makeResizable($(".voice"), "voice");
		makeResizable($(".bath"), "bath");
		makeResizable($(".health"), "health");
		makeResizable($(".stamina"), "stamina");
		makeResizable($(".templocal"), "templocal");
		makeResizable($(".horseHealth"), "horseHealth");
		makeResizable($(".horseStamina"), "horseStamina");
		makeResizable($(".stress"), "stress");
		makeResizable($(".addiction"), "addiction"); */



	window.addEventListener("message", function (event) {
		document.body.style.display = "block";

		let item = event.data;
		let voiceDiv = document.querySelector(".voice");
		let dirtyDiv = document.querySelector(".bath");
		let Btemp = document.getElementById("loading");
		let BTemp = document.getElementById("load");
		thirst = document.getElementById("thirst-v");
		hunger = document.getElementById("hunger-v");
		let voice = document.getElementById("voice-v");
		let bath = document.getElementById("bath-v");
		let temp = document.getElementById("tempnumber");
		let healthPlayerUI = document.querySelector(".health");
		let staminaPlayerUI = document.querySelector(".stamina");
		let healthHorseUI = document.querySelector(".horseHealth");
		let staminaHorseUI = document.querySelector(".horseStamina");
		let HorseXpH = document.getElementById("horseHealth-v");
		let HorseXpS = document.getElementById("horseStamina-v");
		let stressUI = document.querySelector(".stress");
		let addictionUI = document.querySelector(".addiction");
		/* show all divs to edit their positions */
		if (item.action === "edit") {

			const classNames = [
				".temp",
				".hunger",
				".thirst",
				".voice",
				".bath",
				".health",
				".stamina",
				".templocal",
				".horseHealth",
				".horseStamina",
				".stress",
				".addiction"
			];

			classNames.forEach(className => {
				$(className).css("display", "block");
			});

		} else {

			/* notify */
			if (item.type === "hotTemp") {
				BTemp.innerHTML = item.Ht;
			}

			if (item.type === "dirty") {
				bath.innerHTML = item.bathWarning;
			}

			if (item.type === "UI") {
				temp.innerHTML = item.localtemp;

				if (item.usevoice === false) {
					voiceDiv.style.display = "none";
				} else {

					if (item.talking === true) {
						voiceDiv.style.display = "block";
						$(".voice").css("animation", "pulse 0.8s infinite");
						$(".voiceimg").css("animation", "pulseicon 0.3s infinite");
					} else {
						$(".voice").css("animation", "none");
						$(".voiceimg").css("animation", "none");
						/* 		voiceDiv.style.display = "none"; */
					}
				}

				// enabled Bath
				if (item.dirtysystem === false) {
					dirtyDiv.style.display = "none";
				} else {
					if (item.dirtylevel >= 10) {
						$(".bathimg").attr("src", item.imgdirty);
						dirtyDiv.style.display = "block";
					} else {
						dirtyDiv.style.display = "none";
					}
				}
				//enabled stress
				if (item.usestress === false) {
					stressUI.style.display = "none";
				} else {
					if (item.stresslevel >= 1) {

						stressUI.style.display = "block";
						$(".stressimg").attr("src", item.Imgstress);
						$(".stress-img").attr("src", item.ImgCircularStress);
					} else {
						stressUI.style.display = "none";
					}
				}

				//enabled addiction
				if (item.useaddiction === false) {
					addictionUI.style.display = "none";
				} else {
					if (item.addictionlevel >= 1) {
						addictionUI.style.display = "block";
						$(".addictionimg").attr("src", item.Imgaddiction);
						$(".addiction-img").attr("src", item.ImgCircularAddiction);
					} else {
						addictionUI.style.display = "none";
					}
				}

				// enabled heath and stamina player and horse
				if (item.useHealthStaminaSystem === false) {
					healthPlayerUI.style.display = "none";
					staminaPlayerUI.style.display = "none";
					healthHorseUI.style.display = "none";
					staminaHorseUI.style.display = "none";
				} else {
					// player//
					healthPlayerUI.style.display = "block";
					staminaPlayerUI.style.display = "block";

					$(".healthimg").attr("src", item.imgHealth);
					$(".staminaimg").attr("src", item.imgStamina);
					$(".health-img").attr("src", item.imgHealthOutter);
					$(".stamina-img").attr("src", item.imgStaminaOutter);

					// horse //
					if (item.onHorse === false) {
						healthHorseUI.style.display = "none";
						staminaHorseUI.style.display = "none";
					} else {
						healthHorseUI.style.display = "block";
						staminaHorseUI.style.display = "block";
						HorseXpH.innerHTML = item.hXP;
						HorseXpS.innerHTML = item.sXP;

					}

					$(".healthHorseimg").attr("src", item.imgHealthHorse);
					$(".staminaHorseimg").attr("src", item.imgStaminaHorse);

					// check if player is on gold cores
					$(".horsehealth-img").attr("src", item.goldHealthHorse);
					$(".horsestamina-img").attr("src", item.goldStaminaHorse);
				}

				// image change

				$(".hunger-img").attr("src", item.circularFood);
				$(".thirst-img").attr("src", item.circularWater);
				$(".hungerimg").attr("src", item.img);
				$(".thirstimg").attr("src", item.img1);
				$(".voiceimg").attr("src", item.imgVoice);
				$(".tempimg").attr("src", item.imgtemp);
				$(".temp").css("border", item.color);

				// sprinting logic
				if (item.isrunning) {
					if (item.onHorse === false) {
						$(".thirstimg, .staminaimg").css("animation", "pulseicon 0.3s infinite"
						);
						$(".stamina, .thirst").css("animation", "pulse 0.8s infinite");
						if (item.removehunger) {
							$(".hunger").css("animation", "pulse 0.9s infinite");
							$(".hungerimg").css("animation", "pulseicon 0.3s infinite");
						}

						$(".stressimg").css("animation", "pulseicon 0.3s infinite");
						$(".stress").css("animation", "pulse 0.8s infinite");

					} else {
						// if in a horse and sprinting
						$(".staminaHorseimg").css("animation", "pulseicon 0.3s infinite");
						$(".horseStamina").css("animation", "pulse 0.8s infinite");
						$(".thirstimg, .staminaimg").css("animation", "none");
						$(".stamina, .thirst").css("animation", "none");
						$(".stressimg ").css("animation", "pulseicon 0.3s infinite");
						$(".stress").css("animation", "pulse 0.8s infinite");
						if (item.removehunger) {
							$(".hunger,.hungerimg").css("animation", "none");
						}
					}

				} else {
					$(".stamina, .thirst, .horseStamina, .hunger, .hungerimg, .stressimg, .stress, .thirstimg, .staminaimg, .staminaHorseimg").css("animation", "none");
				}

				//pulse
				if (item.pulse === true) {
					Btemp.innerHTML = item.word;
				} else {
					Btemp.innerHTML = item.word;
				}
			}

			if (item.type === "speak") {
				voice.innerHTML = item.rangeType;
			}

			if (item.type === "ShowAll") {
				if (item.HideUi) {
					$(".container").attr("style", "left: -2000px;opacity: 0;visibility: hidden;transition: left 0s 0.8s, visibility 0s 0.8s, opacity 0.8s;");
				} else {
					$(".container").attr("style", "left: 0; opacity: 1;visibility: visible;transition: left 0s, visibility 0s, opacity 0.8s;");
				}
			}

			if (item.type === "health") {
				updateHealth(item);
			}

			if (item.type === "stamina") {
				updateStamina(item);
			}

			if (item.type === "hunger") {
				updateHunger(item);
			}

			if (item.type === "thirst") {
				updateThirst(item);
			}
		}

	});

	function updateStamina(item) {
		$(".stamina .staminaimg").css("animation", "pulseimg 1s;animation-iteration-count: 1;");
		$(".staminaimg").attr("src", item.img);
		hunger.innerHTML = item.Hv;
		setTimeout(function () {
			hunger.innerHTML = "";
			$(".staminaimg").css("animation", "none");
		}, 5000);
	}

	function updateHealth(item) {
		$(".health .healthimg").css("animation", "pulseimg 1s;animation-iteration-count: 1;");
		$(".healthimg").attr("src", item.img);
		hunger.innerHTML = item.Hv;
		setTimeout(function () {
			hunger.innerHTML = "";
			$(".health .healthimg").css("animation", "none");
		}, 5000);
	}

	function updateHunger(item) {
		$(".hunger .hungerimg").css("animation", "pulseimg 1s;animation-iteration-count: 1;");
		$(".hungerimg").attr("src", item.img);
		hunger.innerHTML = item.Hv;
		setTimeout(function () {
			hunger.innerHTML = "";
			$(".hunger .hungerimg").css("animation", "none");
		}, 5000);
	}

	function updateThirst(item) {
		$(".thirstimg .thirst").css("animation", "pulseicon 1s ;animation-iteration-count: 1;");
		$(".thirstimg").attr("src", item.img1);
		thirst.innerHTML = item.Tv;
		setTimeout(function () {
			thirst.innerHTML = "";
			$(".thirst .thirstimg").css("animation", "none");
		}, 5000);
	}


});
