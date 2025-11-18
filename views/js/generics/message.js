/*
* Incluye:
	La Clase de Mensajes para el usuario (error y success)
	La funcion que decodifica un objeto serializado
*/


// Verion 2 ; v2
class MsjAJX {
	constructor(selector = {
		msj: '#MsjAJX',
	}, options = {
		alert: false
	}) {
		this.sel = {
			msj: selector.msj
		}
		this.content = {
			error: '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
				'  <label for="msjAJX" class="alert"></label>' +
				'  <button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
				'    <span aria-hidden="true">&times;</span>' +
				'  </button>' +
				'</div>',
			success: '<div class="alert alert-success alert-dismissible fade show" role="alert">' +
				'  <label for="msjAJX" class="alert"></label>' +
				'  <button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
				'    <span aria-hidden="true">&times;</span>' +
				'  </button>' +
				'</div>',
			warning: '<div class="alert alert-warning alert-dismissible fade show" role="alert">' +
				'  <label for="msjAJX" class="alert"></label>' +
				'  <button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
				'    <span aria-hidden="true">&times;</span>' +
				'  </button>' +
				'</div>'
		}
		this.options = {
			alert: (options.alert != undefined) ? options.alert : false,
		}
		console.log(typeof (paramsGET))
		if (typeof (paramsGET) != 'undefined')
			this._classifyMsjAndShow(paramsGET)

		this.seccionesValidacion = {}
		this.ultimaSeccionPreparada = null
		$(`<style type='text/css'>
		.intermitenteErrorUid{
			animation: infinite resplandorAnimation 2s;
		}
		@keyframes resplandorAnimation {
			0%,100%{
				box-shadow: 0px 0px 20px;
			}
			50%{
			box-shadow: 0px 0px 0px;
			}
		}</style>`).appendTo("head");
	}


	// Clasifica el tipo de mensaje, si es success o error
	_classifyMsjAndShow(msj) {
		if (msj.error != undefined)
			this.showError(msj.error)
		else if (msj.success != undefined)
			this.showSuccess(msj.success)
	}

	showError(error) {
		var divError = '';
		if (typeof (error) === 'string') {
			divError = $(this.content.error)
			divError.find('label').html(b64_to_utf8(error))
			$(this.sel.msj).html(divError)
			this._onShow(divError)
		} else if (typeof (error) === 'object') {
			for (var type in error) {
				switch (type) {
					case 'fields':
						for (var campo in error[type]) {
							var msg = this._getMsgErrorFieldPrepare(campo, error[type][campo])
							divError = $(divError).add(this._getContent('error', msg))
						}
						break;
					case 'seccion':
						divError = this._getMsgErrorSeccionPrepare(error.seccion)
						break;
					case 'fieldsSeccion':
						for (var campo in error[type]) {
							var msg = this._getMsgErrorFieldPrepareSeccion(campo, error[type][campo])
							divError = $(divError).add(this._getContent('error', msg))
						}
						break;
					default:
						break
				}
			}
			$(this.sel.msj).html(divError)
			this._onShow(divError)
		}
	}

	showSuccess(success) {
		var divSucces = ''
		if (typeof (success) === 'string') {
			divSucces = $(this.content.success)
			divSucces.find('label').html(b64_to_utf8(success))
			$(this.sel.msj).html(divSucces)
			this._onShow(divSucces)
		}
	}
	showerror(error) {
		var divError = '';
		if (typeof (error) === 'string') {
			divError = $(this.content.error)
			divError.find('label').html(error)
			$(this.sel.msj).html(divError)
		}
	}

	_onShow(jqDiv) {
		if (jqDiv) {
			$("html, body").animate({
				scrollTop: 0
			}, "slow", function () {
				jqDiv.effect('shake', 'up')
			})
		}
	}

	showWarning(warning) {
		var divWarning = ''
		if (typeof (warning) === 'string') {
			divWarning = $(this.content.warning)
			divWarning.find('label').html(warning)
			$(this.sel.msj).html(divWarning)
		}
	}

	// Borra todos los mensaje de error, succes o warning visibles
	removeMsgs() {
		$(this.sel.msj + ' .alert').alert('close')
	}

	// edita el contenedor de mensaje y lo devuelve en formato jq 
	_getContent(type, msg) {
		if (type == 'error') {
			var content = $(this.content.error)
			content.find('label').html(msg)
			return content
		} else if (type == 'success') {
			return $(this.content.success).find('label').html(msg)
		}
	}

	getMsgErrorField(campo, typeErr) {
		let msg;

		if (isBase64(typeErr))
			return b64_to_utf8(typeErr)

		switch (typeErr) {
			case 'validate_required':
				msg = 'es requerido';
				break;
			case 'validate_required_array':
				msg = "Debe completar los datos de la sección 'SECCION_NAME' ";
				break;
			case 'validate_max_len':
				msg = 'tiene un valor ingresado muy largo';
				break;
			case 'validate_valid_name':
				msg = 'debe contener un nombre valido';
				break;
			case 'validate_integer':
				msg = 'debe ser un número entero';
				break;
			case 'validate_alpha_numeric_space':
				msg = 'debe ser un nombre y/o número valido';
				break;
			case 'validate_phone_number':
				msg = 'debe ser un numero de teléfono valido';
				break;
			case 'valid_web':
				msg = 'debe ser una página web valida';
				break;
			default:
				msg = 'tiene un valor ingresado no valido...'
		}
		return msg
	}

	// trae el UID si la validacion maneja uid
	_getMsgErrorFieldPrepare(campo, typeErr) {
		let input = $('#' + campo),
			campoText, msg

		if (input.length == 0 && (campoText = $('input[type=radio][name=' + campo + ']')
				.parents('div.col-md').find('label[for=' + campo + ']').html()) && campoText.length > 0)
			msg = 'La opcion \'' + campoText + '\' ';
		else {
			campoText = input.prop('placeholder')
			msg = 'El campo \'' + campoText + '\' ';
		}
		if ($('#' + campo).is('select')) {
			campoText = input.children('option:first').html()
			msg = 'Debe seleccionar la opción \'' + campoText + '\''
		} else if (typeErr == 'error_codigo')
			msg = 'Código de error: [#' + campo + ']'
		msg += this.getMsgErrorField(campo, typeErr)
		return msg
	}

	_getMsgErrorFieldPrepareSeccion(campoId, campoObj) {
		let input, campoText, msg, uid = campoObj['UID']

		input = $(`[uidValidador=${uid}]`).addClass('intermitenteErrorUid')
		if (input.length > 0) {
			let seccionId = this.ultimaSeccionPreparada
			let seccionTrigger = this.seccionesValidacion[seccionId].seccionTrigger
			if (typeof (seccionTrigger) == 'function')
				seccionTrigger(input)
		}

		if (input.is('input')) {
			msg = (input.is(':radio')) ? 'La opcion \'' : 'El campo \''

			campoText = input.parents('div.col-md').find('label[for=' + campoId + ']').html()
			if (!campoText)
				campoText = input.prop('placeholder')

			msg += campoText
		} else if (input.is('select')) {
			campoText = input.children('option:first').html()
			msg = 'Debe seleccionar la opción \'' + campoText
		} else if (campoObj['error'] == 'error_codigo')
			msg = 'Código de error: [#' + campoId + ']'
		msg += "' " + this.getMsgErrorField(campoId, campoObj['error'])
		return msg
	}

	_getMsgErrorSeccionPrepare(seccion) {
		let errorFields = Array(),
			divError, seccionText;

		for (const seccionId in seccion) {
			seccionText = this._getSeccionText(seccionId)
			this.ultimaSeccionPreparada = seccionId
			errorFields['fieldsSeccion'] = seccion[seccionId]['fields']
			break;
		}
		if (!seccionText) seccionText = seccionId

		this.showError(utf8_to_b64(
			`<b>Errores encontrados en la seccion : ${seccionText}<b>`
		))
		divError = $(this.sel.msj).html()

		this.showError(errorFields)
		divError += $(this.sel.msj).html()

		return $(divError)
	}

	_getSeccionText(seccionId) {
		let seccionText = this.seccionesValidacion[seccionId]['seccionText']
		if (!seccionText) seccionText = `[${seccionId}]`
		return seccionText
	}

	_getObjCampoUid(uid) {
		let objCampoUid = $(`[uidValidador=${uid}]`)
		return objCampoUid
	}

	setSeccionesValidacion(objSecciones) {
		this.seccionesValidacion = objSecciones
	}

	triggerSeccionValidacion(objJqCampo, seccion) {
		this.seccionesValidacion[seccion].seccionTrigger(objJqCampo)
	}
}



// Convierter un objeto serializado en un objeto
// eje : 'a=1&b=2' => {'a':1,b:'2'}
// Si no funciona este,hay otro en: https://www.progressivethink.in/on/programming/and/jquery-parse-querystring/
function serializeToObj(query) {
	query = query.substring(query.indexOf('?') + 1);
	var re = /([^&=]+)=?([^&]*)/g;
	var decodeRE = /\+/g;
	var decode = function (str) {
		return decodeURIComponent(str.replace(decodeRE, " "));
	};
	var params = {},
		e;
	while (e = re.exec(query)) {
		var k = decode(e[1]),
			v = decode(e[2]);
		if (k.substring(k.length - 2) === '[]') {
			k = k.substring(0, k.length - 2);
			(params[k] || (params[k] = [])).push(v);
		} else params[k] = v;
	}
	var assign = function (obj, keyPath, value) {
		var lastKeyIndex = keyPath.length - 1;
		for (var i = 0; i < lastKeyIndex; ++i) {
			var key = keyPath[i];
			if (!(key in obj))
				obj[key] = {}
			obj = obj[key];
		}
		obj[keyPath[lastKeyIndex]] = value;
	}

	for (var prop in params) {
		var structure = prop.split('[');
		if (structure.length > 1) {
			var levels = [];
			structure.forEach(function (item, i) {
				var key = item.replace(/[?[\]\\ ]/g, '');
				levels.push(key);
			});
			assign(params, levels, params[prop]);
			delete(params[prop]);
		}
	}
	return params;
};




function utf8_to_b64(str) {
	return window.btoa(unescape(encodeURIComponent(str)));
}

function b64_to_utf8(str) {
	return decodeURIComponent(escape(window.atob(str)));
}

function isBase64(str) {
	try {
		return btoa(atob(str)) == str;
	} catch (err) {
		return false;
	}
}


// Otroas pero necesario (v2)

$.fn.getUIDElement = function () {
	let uid = this.attr('uidValidador')
	if (uid == undefined) {
		datosUid = $.data(HTMLBodyElement, 'uidValidador')
		if (datosUid == undefined) {
			datosUid = {
				uidContador: 0,
				get uidNuevo() {
					return this.uidContador++
				},
				temp: null
			}
		}
		uid = datosUid.uidNuevo
		$.data(HTMLBodyElement, 'uidValidador', datosUid)
		this.attr({
			'uidValidador': uid
		}).focusin(function () {
			$(this).removeClass('intermitenteErrorUid')
		})
	}
	return uid
}

$.fn.getChecked = function () {
	return $(this).map(function () {
		if ($(this).is(':checked')) return this
	})
}

$.fn.setUIDElement = function () {
	var uid = this.getUIDElement()
	$.data(HTMLBodyElement, 'uidValidador').temp = {
		UID: uid
	}
	return this
}

$.getDataBindToAjax = function (valor) {
	return {
		UID: $.data(HTMLBodyElement, 'uidValidador').temp.UID,
		val: (valor == undefined) ? '' : valor
	}
}//