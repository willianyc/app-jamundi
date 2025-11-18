var objMsjAJX = null;
$(document).ready(function () {
	objMsjAJX = new MsjAJX()


	$("input[type='password'][data-eye]").each(function (i) {
		let $this = $(this);

		$this.wrap($("<div/>", {
			style: 'position:relative'
		}));
		$this.css({
			paddingRight: 60
		});
		$this.after($("<div/>", {
			html: 'Ver',
			class: 'btn btn-cust-secondary btn-sm',
			id: 'passeye-toggle-' + i,
			style: 'position:absolute;right:10px;top:50%;transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;'
		}));
		$this.after($("<input/>", {
			type: 'hidden',
			id: 'passeye-' + i
		}));
		$this.on("keyup paste", function () {
			$("#passeye-" + i).val($(this).val());
		});
		$("#passeye-toggle-" + i).on("click", function () {
			if ($this.hasClass("show")) {
				$this.attr('type', 'password');
				$this.removeClass("show");
				$(this).removeClass("btn-outline-cust-secondary");
			} else {
				$this.attr('type', 'text');
				$this.val($("#passeye-" + i).val());
				$this.addClass("show");
				$(this).addClass("btn-outline-cust-secondary");
			}
		});
	});

	$('#btn-ingresar').on('click', function () {
		var frm = $(this).parents('form:first').addClass('was-validated');
		invalid = $(frm).find('.form-control:invalid').length
		// Se continua al siguiente paso si el formulario no tiene datos invalidos
		if (invalid == 0) {
			Configuracion()
			loadLogin()
		}
	})

	// function updateTimer(deadline) {
	// 	var time = deadline - new Date();
	// 	return {
	// 		'days': Math.floor(time / (1000 * 60 * 60 * 24)),
	// 		'hours': Math.floor((time / (1000 * 60 * 60)) % 24),
	// 		'minutes': Math.floor((time / 1000 / 60) % 60),
	// 		'seconds': Math.floor((time / 1000) % 60),
	// 		'total': time
	// 	};
	// }


	// function animateClock(span) {
	// 	span.className = "turn";
	// 	setTimeout(function () {
	// 		span.className = "";
	// 	}, 700);
	// }

	// function startTimer(id, deadline) {
	// 	var timerInterval = setInterval(function () {
	// 		var clock = document.getElementById(id);
	// 		var timer = updateTimer(deadline);

	// 		clock.innerHTML = '<span>' + timer.days + '</span>' +
	// 			'<span>' + timer.hours + '</span>' +
	// 			'<span>' + timer.minutes + '</span>' +
	// 			'<span>' + timer.seconds + '</span>';

	// 		//animations
	// 		var spans = clock.getElementsByTagName("span");
	// 		animateClock(spans[3]);
	// 		if (timer.seconds == 59) animateClock(spans[2]);
	// 		if (timer.minutes == 59 && timer.seconds == 59) animateClock(spans[1]);
	// 		if (timer.hours == 23 && timer.minutes == 59 && timer.seconds == 59) animateClock(spans[0]);

	// 		//check for end of timer
	// 		if (timer.total < 1) {
	// 			clearInterval(timerInterval);
	// 			clock.innerHTML = '<span>0</span><span>0</span><span>0</span><span>0</span>';
	// 		}


	// 	}, 1000);
	// }


	// window.onload = function () {
	// 	var deadline = new Date("2020-03-30");
	// 	startTimer("clock", deadline);
	// };

});

function loadLogin() {
	$.post('get/generics/login', {
			usuario: $('#usuario').val(),
			password: $('#password').val()
		})
		.done(function (data) {
			if (data.trim() !== '') {
				data = JSON.parse(data);
				if (data.error != undefined) {
					objMsjAJX.showError(data.error)
					return
				}
				if (data.success == true) {
					location.href = 'index.php?view=principal'
				}
			}
		})
		.fail(function () {
			alert("Su conexión de internet ha fallado");
		});

}

function Configuracion() {
	$.post('get/generics/codigo_barra', {
			usuario: $('#usuario').val(),
			password: $('#password').val()
		})
		.done(function (data) {
			if (data.trim() !== '') {
				data = JSON.parse(data);
				if (data.error != undefined) {
					objMsjAJX.showError(data.error)
					return
				}
				if (data.success == true) {}
			}
		})
		.fail(function () {
			alert("Su conexión de internet ha fallado");
		});

}


class MsjAJX {
	constructor(selector = {
		msj: '#MsjAJX'
	}, alerta = false) {
		this.sel = {
			msj: selector.msj
		}
		this.alerta = alerta
	}

	showError(error) {
		var divError = '';
		if ($.type(error) === 'string') {
			divError = '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
				'  <label for="errorAJX">' + error + '</label>' +
				'  <button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
				'    <span aria-hidden="true">&times;</span>' +
				'  </button>' +
				'</div>'
			$(this.sel.msj).html(divError)
		} else if ($.type(error) === 'array' || $.type(error) === 'object') {
			$.each(error, function () {
				divError += '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
					'  <label for="errorAJX">' + b64_to_utf8(this) + '</label>' +
					'  <button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
					'    <span aria-hidden="true">&times;</span>' +
					'  </button>' +
					'</div>'
			})
			$(this.sel.msj).html(divError)
		}
	}
}

// Funciones Genericas
function utf8_to_b64(str) {
	return window.btoa(unescape(encodeURIComponent(str)));
}

function b64_to_utf8(str) {
	return decodeURIComponent(escape(window.atob(str)));
}//