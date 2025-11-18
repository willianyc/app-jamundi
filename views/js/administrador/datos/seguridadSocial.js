let params = new URLSearchParams(location.search);
var id_funcionario = params.get('id_funcionario');
$(document).ready(function () {
  // $("#identificacion").attr("disabled",true)
  // $("#btnBuscar").hide()
  $('#identificacion').on('keyup', function(e){
     if($(this).val()==""){
       $("input").val("");
       $("select").val("");
     }
       
  });

  Eps()
  fondoPension()
  fondoCesantias()
  arl()
  caja_compensacion()
  setTimeout(() => {
    if(id_funcionario!=null || id_funcionario!="")
    getSeguridadSocial(id_funcionario);
  }, 3000);

  $(document).on("click", ".btnMakeSaldoinicla", function () {
    var frm = $(this).parents('form:first').addClass('was-validated');
    invalid = $(frm).find('.form-control:invalid').length
    // Se continua al siguiente paso si el formulario no tiene datos invalidos
    if (invalid == 0) {
      // $(this).html('Creando...').prop('disabled', true)
      datos_seguridadsocial = $(this).parents('.seguridad_social');
      guardarSeguridadSocial(datos_seguridadsocial)
    }
  })
  $(document).on("click", "#btnBuscar", function () {
    // $(this).html('Buscando...').prop('disabled', true)
    if($('#identificacion').val() != null && $('#identificacion').val() != '' && $('#identificacion').val() != undefined){
     getSeguridadSocial(null, $('#identificacion').val())
    getFuncionario()
    }
  })

  $(document).on("click", ".delete_fun", function () {
    var opcion = confirm("Desea eliminar esta seguridad social");
    if (opcion) {
      id_seguridadsocial = $(this).parents('.seguridad_social').find('.id_seguridadsocial').val()
      element = $(this).parents('.seguridad_social');
      deleteseguridadSocial(id_seguridadsocial, element);
    }
  });

  $(document).on('click', '.btnMakeEditar', function () {
    $(this).parents('.seguridad_social').find('.desactivar').removeAttr('disabled');
    $('#salario').removeAttr('disabled');
  });

  $(document).on('click', '.btnPdf', function () {
    loadReportePDF();
    // $('#salario').removeAttr('disabled');
  });

  $(document).on('click', '.btnExcel', function () {
    loadReporteEcxel();
    // $('#salario').removeAttr('disabled');
  });

  $(document).on('click', '#btnIrAtras', function () {
    location.href = '?view=consultas&mode=consultarseguidadSocial';
  })


  if (id_funcionario != null){
    getFuncionario(id_funcionario)
  }
})

function deleteseguridadSocial(id_seguridadsocial, element) {
  $.post("set/seguridadSocial/eliminar", {
    id_seguridadsocial: id_seguridadsocial,
  }).done(function (data) {
    data = JSON.parse(data);
    if (data.error != undefined) {
      console.log(atob(data.error));
      alertError(btoa("Error al eliminar la movilidad"));
    } else {
      alertSucces(data.success);
      $(element).remove()
    }
  });
}

function guardarSeguridadSocial(seguridad_social) {

  let fecha = new Date();
  let mes = fecha.getMonth() + 1;
  let dia = fecha.getDate();
  let ano = fecha.getFullYear();
  mes_2 = mes < 10 ? '0'+mes: mes;
  let fecha_creacion = ano + '-' + mes_2 + '-' + dia;

  data = {
    fecha_registro: $(seguridad_social).find(".fecha_registro").val() == '' ? null : $(seguridad_social).find(".fecha_registro").val(),
    id_funcionario: $("#id_funcionario").val(),
    entidad_salud: $(seguridad_social).find(".entidad_salud").val(),
    administradora_pension: $(seguridad_social).find(".administradora_pension").val(),
    arl: $(seguridad_social).find(".arl").val(),
    fondo_cesantias: $(seguridad_social).find(".fondo_cesantias").val(),
    caja_compensacion: $(seguridad_social).find(".caja_compensacion").val(),
    id_seguridadsocial: $(seguridad_social).find(".id_seguridadsocial").val(),
    fecha_creacion: $(seguridad_social).find(".fecha_creacion").val() == '' ? fecha_creacion : $(seguridad_social).find(".fecha_creacion").val(),
    salario: $("#salario").val(),
  }
  $.post('set/seguridadSocial/crear', {
    general: JSON.stringify(data)
  }).done(function (data) {
    if (data.trim() !== '') {
      data = JSON.parse(data);
      // objMsjAJX.sel['msj'] = "#MsjAJX";
      if (data.error != undefined) {
        alertError(data.error);
        console.log(atob(data.error))
        return
      }
      if (data.success != undefined) {
        alertSucces(data.success)
      }
    }

  }).always(function () {
    $('#btnGuardar').html('<i class="fa fa-save"></i> GUARDAR').prop('disabled', false)
      .parents('form:first').removeClass('was-validated');

  });
}

function getFuncionario(id_funcionario = null) {
  $.post('ajaxGeneral.php?mode=getFuncionario_2', {
    documento: $("#identificacion").val(),
    id_funcionario: id_funcionario,
  }).done(function (data) {
    if (data.trim() !== '') {
      data = JSON.parse(data);
      if (data.error != undefined) {
        $("input").val('');
        $("#asignacionseguridad").hide()
        alertError(data.error)
        return
      }
      
      $(data).each(function () {
      let salario = this.salario == null || this.salario == '' ? 0 : this.salario
        $("#nombre").val(this.nombre + " " + this.apellidos);
        $("#documento").val(this.documento);
        $("#cargo").val(this.cargo);
        $("#id_funcionario").val(this.id_funcionario);
        $("#identificacion").val(this.documento);
        $("#salario").val(salario);
      });

      if($("#nombre").val()!="" && $("#identificacion").val()!=""){
        $("#asignacionseguridad").show()
      }
    }
    getHistorial();
  });
}
function getHistorial() {
  let template ="";
  $.post('ajaxGeneral.php?mode=historial', {
    id_funcionario: $("#id_funcionario").val(),
  }).done(function (data) {
    if (data.trim() !== '') {
      data = JSON.parse(data);
      if (data.error != undefined) {
        alertError(data.error)
        return
      }
      
      $(data).each(function () {
        template +=`<div class="col-md-12 mb-2">
       <h6 class="submenus">Asignación de seguridad social</h6>
       <div id="seguridad_social">
         <div class="secciones seguridad_social">
           <input type="hidden" class="id_seguridadsocial">
           <div class="row padding-secciones">
             <div class="row">
               <div class="col-md-6 mb-2">
                 <label class="label-form" for="entidad_salud">Entidad Promotora de Salud <span style="color: red;">*</span></label>
                 <select disabled class="form-control input-form color-t border-required entidad_salud">
                   <option  selected >${this.eps}</option>
                 </select>
                 <div class="invalid-feedback">
                   Debe seleccionar la Entidad de salud
                 </div>
               </div>
               <div class="col-md-6 mb-2">
                 <label class="label-form" for="administradora_pension">Entidad Administradora de Fondo de Pensión <span style="color: red;">*</span></label>
                 <select disabled class="form-control input-form color-t border-required administradora_pension">
                   <option  selected disabled>${this.fondo_pension}</option>
                 </select>
                 <div class="invalid-feedback">
                   Debe seleccionar la Administradora de pensión
                 </div>
               </div>
             </div>
             <div class="row">
               <div class="col-md-6 mb-2">
                 <label class="label-form" for="fondo_cesantias">Fondo de Cesantías <span style="color: red;">*</span></label>
                 <select disabled class="form-control input-form color-t border-required fondo_cesantias" tblfuncionarios>
                   <option selected disabled>${this.fondo_cesantias}</option>
                 </select>
                 <div class="invalid-feedback">
                   Debe seleccionar el Fondo de cesantías
                 </div>
               </div>
               <div class="col-md-6 mb-2">
                 <label class="label-form" for="arl">Administradora de Riesgos Laborales <span style="color: red;">*</span></label>
                 <select disabled class="form-control input-form color-t border-required arl" tblfuncionarios>
                   <option selected >${this.arl}</option>
                 </select>
                 <div class="invalid-feedback">
                   Debe seleccionar la Arl
                 </div>
               </div>
             </div>
             <div class="row">
               <div class="col-md-6 mb-2">
                 <label class="label-form" for="caja_compensacion">Caja de Compensación Familiar <span style="color: red;">*</span></label>
                 <select disabled  class="form-control input-form color-t border-required caja_compensacion" tblfuncionarios>
                 <option selected >${this.caja_compensacion}</option>
                 </select>
                 <div class="invalid-feedback">
                   Debe seleccionar la Caja de compensación
                 </div>
               </div>
               <div class="col-md-6 mb-2">
                 <label for="fecha_registro" class="label-form">Fecha de retiro de seguridad social</label>
                 <input disabled  type="text" value"${this.fecha_retiro}" class="form-control input-form color-t disabled border-required fecha_registro">
                 <div class="invalid-feedback">Debe seleccionar la fecha.</div>
               </div>
             </div>
           </div>
         </div>
       </div>
     </div>`
      });
      $("#histori").append(template);
    }
  });
}

function getSeguridadSocial(id_funcionario = null, cedula = null) {
  $.post('ajaxGeneral.php?mode=getFuncionarioSeguridadSocial', {
    id_funcionario: id_funcionario,
    seguridad_social: 1,
    documento: cedula
  }).done(async function (data) {
    let fecha = new Date();
    let mes = fecha.getMonth() + 1;
    let dia = fecha.getDate();
    let ano = fecha.getFullYear();
    mes_2 = mes < 10 ? '0' + mes : mes;
    let fecha_creacion = ano + '-' + mes_2 + '-' + dia;
      if (data.trim() !== '') {
      data = JSON.parse(data);
      if(id_funcionario!=null  || cedula != null ){
      $("#eps").val(data[0].id_eps)
      $("#arl").val(data[0].id_arl)
      $("#pension").val(data[0].id_fondopension)
      $("#cesantias").val(data[0].id_fondocesantias)
      $("#cajacompensacion").val(data[0].id_cajacompensacion)
      $("#fecharetiro").val(data[0].fecha_retiro)
    }
      $('#salario').attr('disabled', 'disabled');
 
      boton = `<button class="btn color-button " id="btnIrAtras" style="float:right" type="button"> IR ATRAS</button>`;
      $('#btn_2').html(boton)
    }
  })
  // .always(function () {
  //   $('#btnBuscar').html('<i class="fa fa-eye"></i> BUSCAR').prop('disabled', false)
  //     .parents('form:first').removeClass('was-validated');
  // });
}

function Eps(id_eps = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    // xhr.open("POST", 'http://jamundi.my/ajaxGeneral.php?mode=eps');
    xhr.open("POST", 'https://app-jamundi.fksas.com/ajaxGeneral.php?mode=eps');
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_eps != null)
        educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_eps == this.id_eps)
          educa += `<option selected value="${this.id_eps}">${this.eps}</option>`;
        else
          educa += `<option value="${this.id_eps}">${this.eps}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_eps != null || cargado != null)
        resolve(educa) // se accede con 'then()'
      else {
        $('.entidad_salud').html(educa)
      }
    }
    xhr.onerror = function () {
      reject(xhr.statusText) // se accede con 'catch()'
    }
    xhr.send();
  })
  // $.post('ajaxGeneral.php?mode=eps')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let sel = '<option value="" selected>Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alert(data.error);
  //       } else {
  //         $.each(data, function () {
  //           sel += `<option value="${this.id_eps}">${this.eps}</option>`;
  //         });
  //       }
  //       $('.entidad_salud').html(sel);
  //     }
  //   })
}

function fondoPension(id_fondopension = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    // xhr.open("POST", 'http://jamundi.my/ajaxGeneral.php?mode=fondoPension');
    xhr.open("POST", 'https://app-jamundi.fksas.com/ajaxGeneral.php?mode=fondoPension');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest'); 
    xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_fondopension != null)
        educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_fondopension == this.id_fondopension)
          educa += `<option selected value="${this.id_fondopension}">${this.fondo_pension}</option>`;
        else
          educa += `<option value="${this.id_fondopension}">${this.fondo_pension}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_fondopension != null || cargado != null)
        resolve(educa) // se accede con 'then()'
      else {
        $('.administradora_pension').html(educa)
      }
    }
    xhr.onerror = function () {
      reject(xhr.statusText) // se accede con 'catch()'
    }
    xhr.send();
  })
  // $.post('ajaxGeneral.php?mode=fondoPension')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let sel = '<option value="" selected>Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alert(data.error);
  //       } else {
  //         $.each(data, function () {
  //           sel += `<option value="${this.id_fondopension}">${this.fondo_pension}</option>`;
  //         });
  //       }
  //       $('.administradora_pension').html(sel);
  //     }
  //   })
}

function fondoCesantias(id_fondocesantias = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    // xhr.open("POST", 'http://jamundi.my/ajaxGeneral.php?mode=fondoCesantias');
    xhr.open("POST", 'https://app-jamundi.fksas.com/ajaxGeneral.php?mode=fondoCesantias');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest'); 
    xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_fondocesantias != null)
        educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_fondocesantias == this.id_fondocesantias)
          educa += `<option selected value="${this.id_fondocesantias}">${this.fondo_cesantias}</option>`;
        else
          educa += `<option value="${this.id_fondocesantias}">${this.fondo_cesantias}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_fondocesantias != null || cargado != null)
        resolve(educa) // se accede con 'then()'
      else {
        $('.fondo_cesantias').html(educa)
      }
    }
    xhr.onerror = function () {
      reject(xhr.statusText) // se accede con 'catch()'
    }
    xhr.send();
  })
  // $.post('ajaxGeneral.php?mode=fondoCesantias')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let sel = '<option value="" selected>Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alert(data.error);
  //       } else {
  //         $.each(data, function () {
  //           sel += `<option value="${this.id_fondocesantias}">${this.fondo_cesantias}</option>`;
  //         });
  //       }
  //       $('.fondo_cesantias').html(sel);
  //     }
  //   })
}

function arl(id_arl = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    // xhr.open("POST", 'http://jamundi.my/ajaxGeneral.php?mode=arl');
    xhr.open("POST", 'https://app-jamundi.fksas.com/ajaxGeneral.php?mode=arl');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_arl != null)
        educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_arl == this.id_arl)
          educa += `<option selected value="${this.id_arl}">${this.arl}</option>`;
        else
          educa += `<option value="${this.id_arl}">${this.arl}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_arl != null || cargado != null)
        resolve(educa) // se accede con 'then()'
      else {
        $('.arl').html(educa)
      }
    }
    xhr.onerror = function () {
      reject(xhr.statusText) // se accede con 'catch()'
    }
    xhr.send();
  })
  // $.post('ajaxGeneral.php?mode=arl')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let sel = '<option value="" selected>Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alert(data.error);
  //       } else {
  //         $.each(data, function () {
  //           sel += `<option value="${this.id_arl}">${this.arl}</option>`;
  //         });
  //       }
  //       $('.arl').html(sel);
  //     }
  //   })
}

function caja_compensacion(id_cajacompensacion = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    // xhr.open("POST", 'http://jamundi.my/ajaxGeneral.php?mode=caja_compensacion');
    xhr.open("POST", 'https://app-jamundi.fksas.com/ajaxGeneral.php?mode=caja_compensacion');
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_cajacompensacion != null)
        educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_cajacompensacion == this.id_cajacompensacion)
          educa += `<option selected value="${this.id_cajacompensacion}">${this.caja_compensacion}</option>`;
        else
          educa += `<option value="${this.id_cajacompensacion}">${this.caja_compensacion}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_cajacompensacion != null || cargado != null)
        resolve(educa) // se accede con 'then()'
      else {
        $('.caja_compensacion').html(educa)
      }
    }
    xhr.onerror = function () {
      reject(xhr.statusText) // se accede con 'catch()'
    }
    xhr.send();
  })
  // $.post('ajaxGeneral.php?mode=caja_compensacion')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let sel = '<option value="" selected>Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alert(data.error);
  //       } else {
  //         $.each(data, function () {
  //           sel += `<option value="${this.id_cajacompensacion}">${this.caja_compensacion}</option>`;
  //         });
  //       }
  //       $('.caja_compensacion').html(sel);
  //     }
  //   })
}


function loadReporteEcxel() {
  var filtro = "";
  id_f = $('#id_funcionario').val();
  // if (filtro != '' && filtro != null) {
  newwindow = window.open("?view=reportes&mode=reporteseguridadsocialexcel&filtro=" + filtro + "&todos=All&id_f=" + id_f, "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var filtro = "";
  id_f = $('#id_funcionario').val();
  newwindow = window.open("?view=reportes&mode=reporteseguridadsocialpdf&filtro=" + filtro + "&todos=All&id_f=" + id_f, "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}//