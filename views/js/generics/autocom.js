// Valida esta pagina necesita enviar parametros por el autocomplete,
// si los necesita los prepara en el objeto data
function getDataSendAutoc(request) {
	if (typeof arrParamsAutoc !== 'undefined') {
		return {
			term: request.term,
			params: arrParamsAutoc
		}
	} else
		return {
			term: request.term
		}
}



//################### Verificacion de Datos del Autocomplete #######
// Guarda cuando el estado de respuesta del servidor al buscar en un Autocomplete es malo
// Es usada para validar que el cliente ingrese un dato traido del servidor en este Autocomplete
class AutocomError {
	constructor() {
		this.cantInpBad = 0;
		this.idInputs = {};
		this.status = {};
	}
	//Añade un elemento tipo AutocomError
	//Se llama cuando la buequeda en un input de autocomplete da un resultado malo
	AddMalo(idInput, status) {
		//Añadimos el elemento
		//Si este input ya existe no lo añadimos
		if (this._isValueInObject(idInput, this.idInputs).result)
			return
		this.idInputs[this.cantInpBad] = idInput;
		this.status[this.cantInpBad] = status;
		this.cantInpBad += 1;
	}

	//Transforma uno en bueno 
	TransformBueno(idInput) {
		//Borra el input del elemeto y resta 1 a la cantidad de inputs malos
		var exist;
		if ((exist = this._isValueInObject(idInput, this.idInputs)).result) {
			delete this.idInputs[exist.index];
			delete this.status[exist.index];
			this.cantInpBad -= 1;
		}
	}

	// Metodo privado
	//Checkea si existe una propierdad que contenga el valor dado para el Objeto especifico
	_isValueInObject(val, obj) {
		var index
		if ((index = Object.values(obj).indexOf(val)) > -1) {
			return {
				result: true,
				index: index
			}
		} else {
			return {
				result: false,
				index: index
			}
		}
	}

}

//Instanciamos el objeto de autocomplete errror;
var AutError = new AutocomError();



//################### FIN - Verificacion de Datos del Autocomplete #######

// Prepara el input del autocomplete, para que muestre el icono
// pertinente a la respuesta del servidor, ademas prepara el tooltip
function bindMsgResponse(input, newClass, title, time = 2000) {
	var sectorIcon = input.next().find('[data-toggle="tooltip"]')
	// Cambiamos el icono de respuesta
	sectorIcon.find('.icon-autocom').removeClass().addClass(newClass)

	// Preparamos el tooltip
	sectorIcon.tooltip('dispose').tooltip({
		delay: {
			"show": 500,
			"hide": time
		},
		title: title
	})
	return sectorIcon
}

//Muestra el mensaje de aviso que desaparece y esta arriba de los 
function showMsgAviso(title, input, time = 2000) {
	sectorIcon = bindMsgResponse(input, 'fa fa-exclamation-triangle icon-autocom', title, time)
	// Lanzamos el tooltip
	sectorIcon.tooltip('show').on('shown.bs.tooltip', function () {
		sectorIcon = $(this)
		setTimeout(function () {
			sectorIcon.tooltip('hide')
		}, time);
	})
}

//Prepara y muestra el mensaje si el servidor me esta mostrando un mensaje controlado de validadcion
// -- Incluye la libreria de mensaje con la clase de MsjAjx (con el objeto ya instanciado)
function tooltErrorValidation(error, idInput) {
	if (error == undefined) return false
	if (error.fields == undefined) return false
	let msgError = 'Este campo ' + window.objMsjAJX.getMsgErrorField(error.fields.term)
	AutError.AddMalo(idInput, 'NO_VALIDO')
	showMsgAviso(msgError, $('#' + idInput), 5000)
	return true
}

//################### Verificacion de Datos del Autocomplete #######
//En cada buscador de pagina valida si algun autocomplete no cargo
// los datos del servidor o  el dato no aparece en los resultados de carga

//¿Hay algun autocomoplete que no encontró coincidencias en db o no le respondio el servidor??
var mensajes = {
	'NO_CONEXION': 'Por favor Busque nuevamente. Si el problema persite verifique su conexión',
	'NO_COINCIDEN_DB': 'No hay coincidencia en el servidor, por favor ingrese correctamente los datos o registre uno nuevo',
	'NO_COINCIDEN_LOCAL': 'El valor ingresado no existe. Por favor escríbalo nuevamente y seleccione alguno de los valores que le aparece en el recuadro',
	'NO_BUSCADO': 'Por favor Busque y seleccione el valor en este campo',
	'NO_VALIDO': 'Este campo tiene un valor ingresado no valido'
}

// Valida que al hacer click en el boton de carga, no exista un error analizado 
// anteriormente
function validaClickBtnAutoc(selectorBtn = ".btnCargar") {
	// console.log(AutError)
	var stopClick = false
	if (AutError.cantInpBad > 0) {
		$.each(AutError.idInputs, function (i) {
			msgError = mensajes[(AutError.status[i])]
			inpAuto = $("#" + AutError.idInputs[i])
			showMsgAviso(msgError, inpAuto, 5000)
			return false
		})
		//return false
		stopClick = true
	} else { //Coincidencias locales
		var valServ, txtInput;
		//Todos los automplete que estan por encima del button 
		var autocompletes = getAutocompletesUp(selectorBtn)
		$.each(autocompletes, function (i) {
			//Valores retornados por el servidor
			valServ = $(this)[0].attributes.lastValores
			txtInput = $(this).val().toUpperCase()
			//Texto escrito por el cliente
			if (valServ == undefined) {
				msgError = mensajes['NO_BUSCADO']
				showMsgAviso(msgError, $(this), 5000)
				stopClick = true;
				return false;
			}
			//Si no existe el texto escrito por el cliente en los ultimos valores retornados por el servidor
			else if (valServ.indexOf(txtInput) == -1 && valServ.length > 0 && txtInput.length > 0) {
				msgError = mensajes['NO_COINCIDEN_LOCAL']
				showMsgAviso(msgError, $(this), 5000)
				stopClick = true;
				return false;
			}
		});
	}
	return !stopClick
}

//Trae todos los autocomplete que estan en arriba de un elemento (Eje: button Buscar)
function getAutocompletesUp(selector) {
	var autocom = Array()
	$('input[type=search],button.btnCargar').each(function () {
		if ($(this).is(selector))
			return false
		if ($(this).is('[autocomplete]'))
			autocom.push(this)
	});
	return autocom
}

function clearAutocomplete(input) {
	$(input).val('')[0].attributes.lastValores = undefined
}

var statusd;
// Modificacion de la function de error al enviar por AJAX
// Solo validar para cuando el input es autocomplete
$(document).ready(function () {
	// Inicializamod todos los tooltips
	/*$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})*/
	// Envia mensaje de error cuando Ajax no obtiene respuesta
	$(document).ajaxComplete(function (event, jqxhr, settings) {
		// console.log( "Triggered ajaxComplete handler." );
		// console.log(event, jqxhr, settings);
		statusd = jqxhr
		inpAuto = $(this.activeElement)
		// Verificamos que el mensaje de Ajax se haya enviado desde un autocomplete
		if (jqxhr.status == 200 && inpAuto.is('[autocomplete]')) {
			// SI 
			if (inpAuto.next().find('.fa-spinner').length > 0)
				bindMsgResponse(inpAuto, 'fa fa-search icon-autocom', 'Buscar')
			// $('.icon-autocom.fa-spinner').removeClass().addClass('fa fa-search icon-autocom')
			//Borramos el elemento de de error
			if (jqxhr.responseText.trim() != "") //Si no esta vacia la respuesta
				AutError.TransformBueno(inpAuto.prop('id'))
		}
	}).ajaxError(function (e, x) {
		inpAuto = $(this.activeElement)
		if (inpAuto.is('[autocomplete]')) {
			// Verificamos que el mensaje de Ajax se haya enviado desde un autocomplete
			// console.log('Error desde autocomplete')
			title = 'No se optuvo respuesta del servidor **'
			statusAutoc = 'UNDEFINED_dd'
			if (x.responseText.trim() == '') {
				title = 'No se encontraron concidencias'
				statusAutoc = 'NO_COINCIDEN_DB'
			}
			if (x.status != 200) {
				title = 'No se optuvo respuesta del servidor, verifique' +
					' su conexión a internet.'
				statusAutoc = 'NO_CONEXION'
			}
			AutError.AddMalo(this.activeElement.id, statusAutoc)
			//$('.rotate-animate').remove()

			//Mostramos el mensaje de error o aviso 
			showMsgAviso(title, inpAuto)
		}
	})

	$.ui.autocomplete.prototype.options.search = function (event, ui) {
		bindMsgResponse($(this), 'fa fa-spinner fa-pulse icon-autocom', 'Buscando...')
		//Añadimos el array que contendra los valores traidos por server
		$(this)[0].attributes.lastValores = undefined
	}




	//################### FIN - Verificacion de Datos del Autocomplete #######
});//