var erroresValidacion,
  objValidateCeldaExcell,
  objMsjAJX,
  objDrawStateRow;
$(document).ready(function () {
  $("#file-xlxs").change(function (e) {
    var sizeinbytes = this.files[0].size;
    var fSExt = new Array("Bytes", "KB", "MB", "GB");
    fSize = sizeinbytes;
    i = 0;
    while (fSize > 900) {
      fSize /= 1024;
      i++;
    }
    $("[name=nombreArchivo]").text(this.files[0].name);
    $("[name=tamano]").text(Math.round(fSize * 100) / 100 + " " + fSExt[i]);
    
		files = event.target.files;
		uploadFiles(files)
		limpiarView()
  });
  $("#fecha_publicacion").change(function (e) {
    $("[name=fechaPublicacion]").text(this.value);
  });
  
  
	objDrawStateRow = new drawStateRowTableExcell()
	new arrowScroll()

	$("#btnSubir").click(function () {
		var frm = $(this).parents('form:first').addClass('was-validated');
		invalid = $(frm).find('.form-control:invalid').length
		if (invalid == 0) {
			// alertWarning(btoa(`Importando archivo...`))
			if ($(this).hasClass('disabled')) return
			document.body.style.cursor = "wait";
			let valida = new ValidateTableExcellEvaluacion('ajaxGeneral.php?mode=evaluacionImportarValidar&action=importar')
			valida.apply()
			objValidateCeldaExcell = valida.objValidateCeldaExcell
		}
	})

	$('a.formatosImportacionAnterirores').click(function(){
		$('#formatosImportacionAnterirores').toggle('600')
	})
});

function changeCell(jqCell){
  if (objValidateCeldaExcell !== undefined)
			objValidateCeldaExcell.removeClassValidationElem(jqCell)
}

function uploadFiles(files) {
	// START A LOADING SPINNER HERE

	// Create a formdata object and add the files
	var data = new FormData();
	$.each(files, function (key, value) {
		data.append(key, value);
	});

	$.ajax({
		url: 'ajaxGeneral.php?mode=evaluacionImportarExcell',
		type: 'POST',
		data: data,
		cache: false,
		dataType: 'json',
		processData: false, // Don't process the files
		contentType: false, // Set content type to false as jQuery will tell the server its a query string request
		success: function (data, textStatus, jqXHR) {
			if (typeof data.error === 'undefined') {
				console.log(data)
				// Success so call function to process the form
				jexcel.fromSpreadsheet(data.ruta, function (result) {
					if (!result.length) {
						console.error('JEXCEL: Something went wrong.');
					} else {
						if (result.length == 1) {
							let numRows
							if ((numRows = result[0]['data'].length) > 1501) {
								alert('El archivo debe tener como máximo 1000 registros. El archivo tiene ' + numRows + ' registros')
							} else {
                options = result[0];
                options.onchange = function(instance, cell, x, y, value) {
                  changeCell($(cell))
                  // var cellName = jexcel.getColumnNameFromId([x,y]);
                  // console.log('New changaaae on cell ' + cellName + ' to: ' + value + '');
                };
								mySpreadsheet = jexcel(document.getElementById('spreadsheet3'), options);
							}
						} else {
							jexcel.createTabs(document.getElementById('spreadsheet3'), result);
						}
					}
				});

			} else {
				// Handle errors here
				console.log('ERRORS: ' + data.error);
			}
			$(event.target).prop('disabled', false)
		},
		error: function (jqXHR, textStatus, errorThrown) {
			// Handle errors here
			console.log('ERRORS: ' + textStatus);
			// STOP LOADING SPINNER

			$(event.target).prop('disabled', false)
		}
	});
}

function limpiarView() {
	$('#spreadsheet3').html('')
	$('#significado').hide()
}

class sendPackEvaluacion {
	constructor() {
		this.evaluaciones = null;
		this.indexPack = 0;
		this.uri = null;
		this.isValidation = null;
		this.hasError = false
		this.codigoPack = (new Date()).getTime() * 33 + "_PACK";
		this.version = null
	}

	send(prod, uri, isValidation, version) {
		this.evaluaciones = prod
		this.uri = uri
		this.isValidation = isValidation
		this.version = version
		this._sendPackEvaluacion()
	}

	_sendPackEvaluacion() {
		if (this.indexPack === this.evaluaciones.length || Object.keys(this.evaluaciones).length === 0) {
			return
		}
		let objSend = this
		let data = {
			action: true,
			versionImportador : this.version,
			numPack: {
				codigo: this.codigoPack,
				index: this.indexPack
			},
			evaluacion: JSON.stringify(this.evaluaciones),
		}
		return $.post(this.uri, data, function () {
			if (!objSend.isValidation)
				objDrawStateRow.send(objSend.evaluaciones[objSend.indexPack])
			objSend.indexPack++
		}).done(function (data) {
			if (data.trim === undefined || data.trim() !== '') {
				data = JSON.parse(data);
				if (data.error != undefined) {
          console.log(atob(data.error));
        //   alertError(atob("Error al Insertar las evaluaciones."));
					// console.error(`Error al enviar el Pack #${data}`)
					// console.log(b64_to_utf8(data.error))
				}
				if (data.success != undefined) {
					// alertSucces(data.success)
					let errores = {};
					if ((data.errores !== undefined && data.errores.length !== 0)) {

						objCombine(data.errores, errores)
						// $('#btnValidar').removeClass('disabled')
						objSend.hasError = true
						$('#significado').show()
					} else if (!objSend.hasError) {
						if (!objSend.isValidation && objSend.indexPack === objSend.evaluaciones.length) {
							objDrawStateRow.response(data, objSend.evaluaciones[objSend.indexPack - 1])
						} else {
							alertSucces(data.success)
						}
					}
					if (!objSend.isValidation) {
						objDrawStateRow.response(data, objSend.evaluaciones[objSend.indexPack - 1])
						if (objSend.hasError)
							document.body.style.cursor = "";
					} else if (objSend.hasError)
						objSend._sendPackEvaluacion()

					objCombine(data.observaciones == undefined ? {} : data.observaciones, errores)
					translateMsgErrorServer(errores)
					if (objSend.indexPack === objSend.evaluaciones.length && objSend.isValidation) {
						if (!objSend.hasError) {
							$('#btnImportar').removeClass('disabled')
							$('#btnValidar').removeClass('disabled')
						} else {
							$('#btnValidar').removeClass('disabled')
							objDrawStateRow.updateCountErrors()
						}
						document.body.style.cursor = "";
					} else if (objSend.indexPack === objSend.evaluaciones.length && !objSend.isValidation) {
						$('#btnImportar,#btnValidar').removeClass('disabled')
						document.body.style.cursor = "";
					}

					// objCombine(data.observaciones == undefined ? {} : data.observaciones, errores)
					// translateMsgErrorServer(errores)
					console.log(`#### FIN ; Se ha enviado el pack`)
				}
			} else {
				$('#btnValidar').removeClass('disabled')
				document.body.style.cursor = "";
			}
		})
	}

}

function objCombine(obj, variable) {
	for (let key of Object.keys(obj)) {
		if (!variable[key]) variable[key] = Array();

		for (let innerKey of Object.keys(obj[key]))
			variable[key].push(obj[key][innerKey]);
	}
}


function translateMsgErrorServer(errores, arMismoError = ['SUCURSAL', 'MARCA', 'CATEGORIA', 'CODIGO_DUPLICADO', 'PROVEEDOR']) {
	const CODIGO_X = 0 //Posicion de la columna codigo
	const ERROR_CLASE = {
		mitadnuevo: 'vte-mitadnuevo',
		duplicado: 'vte-duplicate',
		numerico: 'vte-invalid-number',
		menor: 'vte-less-than',
		existente: 'vte-existente',
		inexistente: 'vte-inexistente',
		nueva: 'vte-nueva',
		vacio: 'vte-vacio',
		otro: 'vte-otro',
	}
	let bindOtroError = function(error,jqCelda, msgError){
		let otroErrorInServer = {
			'inexistente-fsd' : {
				idClass: "validateInactivo-articulo",
				msgError: 'El Funcionario no existe.',
      },
		}
		let errorOtro = otroErrorInServer[error]
		if(errorOtro !== undefined){
			let jqElement = jqCelda.addClass('vte-otro')
			objValidateCeldaExcell.setMsgTooltip(jqElement,errorOtro['idClass'], errorOtro['msgError'])
		}

	}
	let header = objValidateCeldaExcell.getHeader()
	for (const codigo in errores) {
		let jqCelda = objValidateCeldaExcell.getCeldaInX(1, codigo),
			celdaY = Number(objValidateCeldaExcell.getXYCelda(jqCelda)['y']) + 1,
			jqRow = objValidateCeldaExcell.getRow(celdaY);

		for (const errorMsg of errores[codigo]) {
			let error = errorMsg.split('_'),
				titulo = error[0].toUpperCase(),
				headerY = header.indexOf(titulo),
				jqCelda = $(jqRow[headerY])
			if (arMismoError.includes(errorMsg.toUpperCase() == 'CODIGO_DUPLICADO' ? 'CODIGO_DUPLICADO' : titulo)) {
				let jqColumn = objValidateCeldaExcell.getColumn(jqCelda),
					valorCelda = jqCelda.html(),
					arColumn = jqColumn.filter(function (i) {
						return i < 2 ?
							false :
							$(this).html() === valorCelda;
					})
				arColumn.addClass(ERROR_CLASE[error[1]])
			} else{
				let clase = ERROR_CLASE[error[1]]
				if(clase == undefined){
					bindOtroError(error[1],jqCelda)
				}else
					jqCelda.addClass(clase)
			}
		}
	}
}


class ValidateTableExcellEvaluacion {
	constructor(uriAjax, isValidation = true) {
		this.validator = null
		this.version  = null
		this.validatorVersion = {
			v1_1 : {
        "PERIODO": [
          {
            fun: 'addTextToEmpty',
            params: null
          }, ],
        "CEDULA EVALUADO": [{
          fun: 'addTextToEmpty',
          params: null
        }, ],
        "EVALUADO": [{
          fun: 'addTextToEmpty',
          params: null
        }, ],
        "VALOR TOTAL": [{
          fun: 'addTextToEmpty',
          params: null
        }, ],
			}
		}

		this.uriAjax = uriAjax
		this.isValidation = isValidation
		this.prefixClass = 'vte-'

		this.objValidateCeldaExcell = new ValidateCeldaExcell();
    this.objValidateCeldaExcell.validateRequiredInPersonaJuridica = function(params){
      let validateTipoPersona = function (params,obj){
        if (obj.columnCompare == undefined || obj.columnCompare['title'] != params.column) {
          // Calculamos la posicion de la columna a comparar si no existe
          obj.columnCompare['title'] = params.column
    
          let header = obj.getHeader()
          let iTitle = header.indexOf(obj.columnCompare['title'])
          obj.columnCompare['x'] = iTitle
        }
    
        let posXY = obj.getXYCelda(obj._jqCelda)
        let jqCeldaCompare = $(`td[data-x=${obj.columnCompare['x']}][data-y=${posXY['y']}]`)
        
        let hasValidacion = false
        let textColumn = jqCeldaCompare.html().toUpperCase()
        for (const validar of params.validar) {
          if (typeof (validar) == "object") {
            if ('regex' in validar && textColumn.match(validar.regex) != null) {
              hasValidacion = true
              break
            } else if ('text' in validar && textColumn == validar.text) {
              hasValidacion = true
              break
            }
          }
        }
        return hasValidacion
      }

      let validaActualEmpty = function (params,obj){
        // this._jqCelda.tooltip('disable')
        let hasValidacion = false
        for (const validar of params.validar) {
          if (typeof (validar) == "object") {
            if ('regex' in validar && obj.valCelda.match(validar.regex) != null) {
              hasValidacion = true
              break
            } else if ('text' in validar && obj.valCelda == validar.text) {
              hasValidacion = true
              break
            }
          }
        }
        return hasValidacion
      }
      
      if((!validaActualEmpty(params,this) && validateTipoPersona(params.columnBefore,this))){
        let jqElement = this._jqCelda.addClass('vte-otro')
        this.setMsgTooltip(jqElement, params.idClass, params.msgError)
      }
    }
		this.objValidateCeldaExcell['removeClassValidationElem'] = this.removeClassValidationElem;
		this.objValidateCeldaExcell['prefixClass'] = this.prefixClass
	}

	apply() {
		let objValidateCeldaExcell = this.objValidateCeldaExcell,
			header = objValidateCeldaExcell.getHeader(),
			erTitulo = this._validateHeader(header)
		if (true !== erTitulo) {
			// alertError(btoa(`Titulo mal escrito: ${erTitulo['title']} para el formato: ${erTitulo['version']}`))
			$('#btnValidar').removeClass('disabled')
			document.body.style.cursor = "";
			return false
		}
		this._removeAllClassValidation()
		let time = (new Date()).getTime()
		console.log(`# Validacion de las columnas (cliente) ${time}`);
		for (let title in this.validator) {
			let iTitle = header.indexOf(title)
			let jqCelda = $(header.prevObject[iTitle])
			let funValidator = this.validator
			let jqColumn = objValidateCeldaExcell.getColumn(jqCelda)
			objValidateCeldaExcell.jqColumn = jqColumn;
			jqColumn.each(function (i) {
				if (i < 2) return
				objValidateCeldaExcell.jqCelda = $(this);
				let sizeFun = funValidator[title].length
				for (var i = 0; i < sizeFun; i++
					// let fun of funValidator[title]
					) {
						let fun = funValidator[title][i]
					if(typeof (fun['params']) == 'object' && null != fun['params'] && 'isOnlyOnce' in fun['params'] && fun['params']['isOnlyOnce']){
						if(!fun['params']['isOnlyOnceApplied']){
							funValidator[title][i]['params']['isOnlyOnceApplied'] = true;
							objValidateCeldaExcell[fun['fun']](fun['params']);
						}
					}else
						objValidateCeldaExcell[fun['fun']](fun['params']);
				}
			})
		}
		time = (new Date()).getTime()
		console.log(`# Validacion de las columnas (cliente) - FIN ${time}`);
		var packevaluaciones = objValidateCeldaExcell.validateNew();
		console.log('## Paquete de evaluaciones creados')
		let objSendPack = new sendPackEvaluacion()
		objSendPack.send(packevaluaciones, this.uriAjax, this.isValidation, this.version)
	}

	_removeAllClassValidation() {
		$(this.objValidateCeldaExcell.selTable + ' td[class^=' + this.prefixClass + ']').each((i, elem) => {
			this.removeClassValidationElem(elem)
		})
	}

	removeClassValidationElem(elem) {
		let clases = $(elem).prop('class').split(' ').filter(text => (new RegExp('^' + this.prefixClass)).test(text)).join(' ')
		if (clases !== '')
			$(elem).removeClass(clases)
    $(elem).tooltip('dispose')
    $('.tooltip').remove()
	}

	_validateHeader(header) {
		let errorTitle = {}
		for (const version in this.validatorVersion) {
			for (const title of header) {
				if (!(title in this.validatorVersion[version])) {
					// errorTitle[version] = {
					// 	title,
					// 	version
					// }
					break
				}
			}
			if(jQuery.isEmptyObject(errorTitle) || !(version in errorTitle)){
				this.validator = this.validatorVersion[version]
				this.version = version
				return true
			}
		}
		let getErrorRelevanteByVersion = function(errrorTitle){
			// Obtenemos el error de la version mas nueva
			return errrorTitle[Object.keys(errrorTitle)[Object.keys(errrorTitle).length - 1]]
		}

		return getErrorRelevanteByVersion(errorTitle)
	}
}

class drawStateRowTableExcell {
	send(evaluaciones) {
		let posXToFind = objValidateCeldaExcell.getHeader('CODIGO')
		for (const prod in evaluaciones) {
			let jqTdEstadoRows = objValidateCeldaExcell.getCeldaInX(posXToFind, evaluaciones[prod]['CODIGO']).parents('tr').find('.jexcel_row')
			jqTdEstadoRows.find('.estado-row').remove()
			jqTdEstadoRows.html(jqTdEstadoRows.html() + `<div class='estado-row'><i class='fa fa-spinner fa-pulse'></i></div>`)
		}
	}

	response(response, evaluaciones) {
		if (response.success !== undefined) {
			let posXToFind = objValidateCeldaExcell.getHeader('CODIGO')
			if (response.errores === undefined) {
				for (const prod in evaluaciones) {
					let jqTdEstadoRows = objValidateCeldaExcell.getCeldaInX(posXToFind, evaluaciones[prod]['CODIGO']).parents('tr').find('.jexcel_row')
					jqTdEstadoRows.find('.estado-row').remove()
					jqTdEstadoRows.html(jqTdEstadoRows.html() + `<div class='estado-row'><i class='fa fa-check-circle text-success'></i></div>`)
				}
				return
			}

			for (const codigo in response.errores) {
				let jqTdEstadoRows = objValidateCeldaExcell.getCeldaInX(posXToFind, codigo).parents('tr').find('.jexcel_row')
				jqTdEstadoRows.find('.estado-row').remove()
				jqTdEstadoRows.html(`${jqTdEstadoRows.html()}<div class='estado-row'><i class='fa fa-exclamation-circle text-danger'></i></div>`)
			}

			for (const prod in evaluaciones) {
				let jqTdEstadoRows = objValidateCeldaExcell.getCeldaInX(posXToFind, evaluaciones[prod]['CODIGO']).parents('tr').find('.jexcel_row'),
					jqTdEstadoRowsModificar = jqTdEstadoRows.find('.estado-row i:not(.fa-exclamation-circle)')
				if (jqTdEstadoRowsModificar.length) {
					jqTdEstadoRows.find('div.estado-row').remove()
					jqTdEstadoRows.html(`${jqTdEstadoRows.html()}<div class='estado-row'><i class='fa fa-ban text-danger'></i></div>`)
				}
			}
		}
	}

	removeEstado() {
		$('.estado-row').remove()
	}

	updateCountErrors() {
		const ERROR_CLASE = {
			mitadnuevo: 'vte-mitadnuevo',
			duplicado: 'vte-duplicate',
			numerico: 'vte-invalid-number',
			menor: 'vte-less-than',
			existente: 'vte-existente',
			inexistente: 'vte-inexistente',
			nueva: 'vte-nueva',
			vacio: 'vte-vacio',
			otro: 'vte-otro',
		}

		for (const key in ERROR_CLASE) {
			let error = ERROR_CLASE[key],
				jqTdErrors = $(objValidateCeldaExcell.selTable + ' .' + error),
				countErrors = jqTdErrors.length
			if (countErrors) {
				$('table.table-significado td.' + error).html(
					`<a class="link-vte-error ${error}" href="javascript:void(0)">${(countErrors>0?countErrors:'-----')}</a>`
				)
			} else {
				$('table.table-significado td.' + error).html('-----')
			}
		}

		$('a.link-vte-error').click(function (e) {
			let clase = $(this)[0].classList.item(1),
				jqTd = $(objValidateCeldaExcell.selTable + ' .' + clase),
				jqTdCerca = jqTd[jqTd.length - 1]

			$("html, body").animate({
				scrollTop: jqTdCerca.offsetTop
			}, "slow", function () {
				$(jqTdCerca).effect('shake', 'up')
			})
			e.preventDefault();
			return false
		})
	}

}

class arrowScroll {
	constructor() {
		this._addStyle()
		this._bindHtml()
		// ===== Scroll to Top ==== 
		$(window).scroll(function () {
			let maxScroll = $(document).height(),
				heightScreen = $(window).height()
			if ($(this).scrollTop() < (maxScroll - heightScreen)) { // If page is scrolled more than 50px
				$('#return-to-top').fadeIn(200); // Fade in the arrow
			} else {
				$('#return-to-top').fadeOut(200); // Else fade out the arrow
			}
		});
		$('#return-to-top').click(function () { // When arrow is clicked
			$('body,html').animate({
				scrollTop: $(document).height() // Scroll to top of body
			}, 500);
		});

	}

	_bindHtml() {
		$('body').append('<a href="javascript:" id="return-to-top"><i class="fa fa-arrow-down"></i></a>')
	}

	_addStyle() {
		$(`<style type='text/css'>
			#return-to-top {
				position: fixed;
				bottom: 20px;
				right: 20px;
				background: rgb(0, 0, 0);
				background: rgba(0, 0, 0, 0.7);
				width: 50px;
				height: 50px;
				display: block;
				text-decoration: none;
				-webkit-border-radius: 35px;
				-moz-border-radius: 35px;
				border-radius: 35px;
				display: none;
				-webkit-transition: all 0.3s linear;
				-moz-transition: all 0.3s ease;
				-ms-transition: all 0.3s ease;
				-o-transition: all 0.3s ease;
				transition: all 0.3s ease;
			}
			#return-to-top i {
				color: #fff;
				margin: 0;
				position: relative;
				left: 16px;
				top: 13px;
				font-size: 19px;
				-webkit-transition: all 0.3s ease;
				-moz-transition: all 0.3s ease;
				-ms-transition: all 0.3s ease;
				-o-transition: all 0.3s ease;
				transition: all 0.3s ease;
			}
			#return-to-top:hover {
				background: rgba(0, 0, 0, 0.9);
			}
			#return-to-top:hover i {
				color: #fff;
				top: 5px;
			}
			.tooltip {
				position: fixed;
				z-index: 3000
			}
			</style>`).appendTo("head");
	}
}//