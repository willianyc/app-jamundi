$(document).ready(function () {
  Eps();

  $('#identificacion').on('keyup', function(e){
    if($(this).val()==""){
      $("input").val("");
      $("select").val("");
    }
      

 });



  $("#datos_incapacidad").hide();
  $(document).on("click", ".delete_fun", function () {
    id_incapacidad = $(this).parents('.incapacidades').find('.id_incapacidad').val()
    element = $(this).parents('.incapacidades');
    deleteIncapacidad(id_incapacidad, element);
  });

  $(document).on('click', '.btnExcel', function () {
    loadReporteEcxel();
  });

  $(document).on('click', '.btnPdf', function () {
    loadReportePDF();
  });

  $(document).on('click', '.btnMakeEditar', function () {
    $(this).parents('.incapacidades').find('.desactivar').removeAttr('disabled');
  });

  $(document).on('click', '.btnMakeSaldoinicla', function () {
    var frm = $(this).parents('form:first').addClass('was-validated');
    invalid = $(frm).find('.form-control:invalid').length
    if (invalid == 0) {
      $(this).html('GUARDAR').prop('disabled', true)
      datos_incapacidad = $(this).parents('.incapacidades');
      guardarIncapacidad(datos_incapacidad)
    }
  })

  let params = new URLSearchParams(location.search);
  var id_incapacidad = params.get('id_incapacidad');
  var id_funcionario = params.get('id_funcionario');
  if (id_funcionario != null){
    getIncapacidad(id_funcionario);
    getFuncionario(id_funcionario)
  }
  // $(document).on("click", "#btnGuardar", function () {
  //   var frm = $(this).parents('form:first').addClass('was-validated');
  //   invalid = $(frm).find('.form-control:invalid').length
  //   // Se continua al siguiente paso si el formulario no tiene datos invalidos
  //   if (invalid == 0) {
  //     $(this).html('Creando...').prop('disabled', true)
  //     guardarIncapacidad()
  //   }
  // })

  $(document).on('click', '#btnIrAtras', function () {
    location.href = '?view=consultas&mode=consultarincapacidad';
  })

  $(document).on("click", "#btnBuscar", function () {
    $(this).html('Buscando...').prop('disabled', true)
    getIncapacidad(null, $('#identificacion').val())
    if($('#identificacion').val()!=""){
    getFuncionario()
    }
  })
})


$(document).on('change', '.fecha_inicio', function () {
  if($(".dias_incapacidad").val()>0){
   if( $(".dias_incapacidad").val()==1){
    $(".fecha_fin").val($(this).val())
   }else if( $(".dias_incapacidad").val()>1){
    let fecha=$(this).val();
     let date= fecha.split('-');
    let dias = Number($(".dias_incapacidad").val())-1; 
 
    var tmpDate = new Date(date[0] , date[1], date[2]); // Augest 20, 2020

    console.log(addDaysToDate(tmpDate, dias));
   }
  }
});

$(document).on('change','.dias_incapacidad',function(){
  if($(".dias_incapacidad").val()>0){
    if( $(".dias_incapacidad").val()==1){
     $(".fecha_fin").val($('.fecha_inicio').val())
    }else if( $(".dias_incapacidad").val()>1){
     let fecha=$('.fecha_inicio').val();
      let date= fecha.split('-');
     let dias = Number($(".dias_incapacidad").val())-1; 
  
     var tmpDate = new Date(date[0] , date[1], date[2]); // Augest 20, 2020
 
     console.log(addDaysToDate(tmpDate, dias));
    }
   }
})

function addDaysToDate(date, days){
  var res = new Date(date);
    let newdias = res.getDate()+days;
    res.setDate(newdias)
    let newDia;
    let newMes;
    if(newdias <=9){
          newDia = "0"+res.getDate()
    } else{
      newDia = res.getDate()
    }
    if(res.getMonth()<=9){
      newMes = "0"+res.getMonth();
    }else{
      newMes = res.getMonth();
    }
    let newFecha = res.getFullYear()+"-"+newMes+"-"+newDia;
    $(".fecha_fin").val(newFecha)

}



function deleteIncapacidad(id_incapacidad, element) {
  $.post("set/incapacidad/eliminar", {
    id_incapacidad: id_incapacidad,
  }).done(function (data) {
    data = JSON.parse(data);
    if (data.error != undefined) {
      console.log(data.error);
      alertError(btoa("Error al eliminar la incapacidad"));
    } else {
      alertSucces(data.success);
      $(element).remove()
    }
  });
}

function guardarIncapacidad(datos_incapacidad) {
  data = new FormData()
  data.append('id_funcionario', $("#id_funcionario").val());
  data.append('dias', $(datos_incapacidad).find(".dias_incapacidad").val());
  data.append('id_incapacidad', $(datos_incapacidad).find(".id_incapacidad").val());
  data.append('fecha_inicio', $(datos_incapacidad).find(".fecha_inicio").val());
  data.append('fecha_fin', $(datos_incapacidad).find(".fecha_fin").val());
  data.append('diagnostico', $(datos_incapacidad).find(".diagnostico").val());
  data.append('tipo_incapacidad', $(datos_incapacidad).find(".tipo_incapacidad").val());
  data.append('archivo_incapacidad', $(datos_incapacidad).find(".archivo_incapacidad")[0].files[0]);
  // id_eps: $("#eps").val(),

  $.ajax({
    type: 'POST',
    url: 'set/incapacidad/crear',
    data: data,
    contentType: false,
    processData: false,
    success: function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);     
        if (data.error != undefined) {

          alertError(data.error);
          // console.log(atob(data.error))
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
    // })
    // $.post('set/incapacidad/crear', {
    //   general: JSON.stringify(data)
    // }).done(function (data) {
    //   if (data.trim() !== '') {
    //     data = JSON.parse(data);
    //     // objMsjAJX.sel['msj'] = "#MsjAJX";
    //     if (data.error != undefined) {
    //       alertError(btoa('Error al crear la incapacidad'));
    //       console.log(atob(data.error))
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
  $.post('ajaxGeneral.php?mode=getFuncionario_2', {
    documento: $("#identificacion").val(),
    id_funcionario: id_funcionario
  }).done(function (data) {
    if (data.trim() !== '') {
      // data.replace("getFuncionario", 'ss')
      data = JSON.parse(data);
      if (data.error != undefined) {
        alertError(data.error)
        $("#input").val("");
        $("#select").val("");
        $("#datos_incapacidad").hide()
        return
      }
      $(data).each(function () {
        $("#nombre").val(this.nombre + " " + this.apellidos)
        $("#documento").val(this.documento)
        $("#identificacion").val(this.documento)
        $("#cargo").val(this.cargo)
        $("#id_funcionario").val(this.id_funcionario)
        $("#salario").val(this.salario)
        $("#id_funcionario").val(this.id_funcionario)
        $("#id_incapacidad").val('')
        $("#dias_incapacidad").val('')
        $("#fecha_inicio").val(this.fecha_ingreso_nombra)
        $("#fecha_fin").val('')
        $("#diagnostico").val('')
        $("#tipo_incapacidad").val('')
        $("#archivo_incapacidad").val('')
        console.log(this)
      });
      if($("#nombre").val()!="" && $("#identificacion").val()!="" && $("#cargo").val()!=""){
        $("#datos_incapacidad").show()
      }

 

    }
  }).always(function () {
    $('#btnBuscar').html('<i class="fa fa-eye"></i> BUSCAR').prop('disabled', false)
      .parents('form:first').removeClass('was-validated');

  });
}

function getIncapacidad(id_funcionario = '', cedula = null) {
  $.post('ajaxGeneral.php?mode=getIncapacidad', {
    id_funcionario: id_funcionario,
    cedula: cedula
  }).done(function (data) {
    if (data.trim() !== '') {
      // data.replace("getFuncionario", 'ss')
      data = JSON.parse(data);
      incapacidades = '';
      if (data.error != undefined) {
        $('#incapacidades').html('');
        incapacidades += `<form action="" enctype="multipart/form-data" class="mb-3">
    <div class="incapacidades secciones pb-3">
<div class="row padding-secciones">
  <input type="hidden" class="id_incapacidad">
  <div class="row">
    <div class="col-md-6 mb-2">
      <label class="label-form">Días de incapacidad <span style="color: red;">*</span></label>
      <input type="number" class="form-control input-form border-required color-t dias_incapacidad" required="" name="dias_incapacidad" placeholder="Días de incapacidad...">
      <div class="invalid-feedback">Debe ingresar los días de incapacidad</div>
    </div>
    <div class="col-md-6 mb-2">
      <label for="fecha_inicio" class="label-form">Fecha de inicio <span style="color: red;">*</span></label>
      <input id="fecha_inicio" type="date" class="form-control input-form color-t border-required fecha_inicio" required="">
      <div class="invalid-feedback">Debe seleccionar la fecha.</div>
    </div>
    <div class="col-md-6 mb-2">
      <label for="fecha_fin" class="label-form">Fecha final <span style="color: red;">*</span></label>
      <input type="date" class="form-control input-form color-t border-required fecha_fin" required="">
      <div class="invalid-feedback">Debe seleccionar la fecha.</div>
    </div>
    <div class="col-md-6 mb-2">
      <label class="label-form">Diagnóstico <span style="color: red;">*</span></label>
      <input type="text" class="form-control input-form border-required color-t diagnostico" name="diagnostico" required="" placeholder="Diagnóstico...">
      <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
    </div>
    <div class="col-md-6 mb-2">
      <label class="label-form" for="tipo_incapacidad">Tipo de incapacidad <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required tipo_incapacidad" required="">
        <option value="" selected disabled>Seleccione...</option>
        <option value="EG">EG</option>
        <option value="AL">AL</option>
        <option value="SOAT">SOAT</option>
        <option value="LM">LM</option>
        <option value="LP">LP</option>
      </select>
      <div class="invalid-feedback">
        Debe seleccionar la Tipo de incapacidad
      </div>
    </div>
    <div class="col-md-6 mb-2">
      <label class="label-form">Adjuntar archivo <span style="color: red;">*</span></label>
      <input type="file" accept="application/pdf" class="form-control input-form border-required color-t archivo_incapacidad" name="archivo_incapacidad" required="" id="archivo_incapacidad" placeholder="Diagnóstico...">
      <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
    </div>
  </div>
</div>
<div class="col-md-12 mb-5 mt-1" style="flex-direction: row-reverse" id="btns">
  <button class="btn color-button btnMakeSaldoinicla" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
</div>
</div></form>`;
        $('#incapacidades').append(incapacidades)
        // alertError(data.error)
        return
      }
      i = 1;
      $('#incapacidades').html('');
      caract = data.length;
      $(data).each(function () {
        // $("#nombre").val(this.nombre + " " + this.apellidos)
        // $("#documento").val(this.documento)
        // $("#btnBuscar").attr('disabled', 'disabled')
        // $("#identificacion").attr('disabled', 'disabled')
        // $("#identificacion").val(this.documento)
        // $("#cargo").val(this.cargo)
        // $("#id_funcionario").val(this.id_funcionario)
        // $("#salario").val(this.salario)
        // $("#dias_incapacidad").val(this.dias)
        // $("#id_funcionario").val(this.id_funcionario)
        // $("#fecha_inicio").val(this.fecha_ini)
        // $("#fecha_fin").val(this.fecha_fin)
        // $("#diagnostico").val(this.diagnostico)
        // $("#tipo_incapacidad").val(this.tipo_incapacidad)
        // $("#archivo_incapacidad").val(this.archivo_laboral)

        incapacidades = `<form action="" enctype="multipart/form-data" class="mb-3">
    <div class="incapacidades secciones pb-3">
        <div class="row padding-secciones">
        <div class="col-md-12 mt-3" style="">
                <!-- <button class="btn btn-danger btn-sm desactivar delete_fun" disabled style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> ELIMINAR</button>
                <button class="btn color-button btnMakeSaldoinicla desactivar" disabled style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
                <button class="btn color-button btnMakeEditar" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> EDITAR</button> -->
                <button class="btn btn-otros m-1 delete_fun desactivar" disabled style="float:right" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>          
                <button class="btn btn-otros m-1 btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
                <button class="btn btn-otros m-1 btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
                <button class="btn btn-otros m-1 btnMakeEditar" style="float:right" type="button"> <i class="fa fa-pencil"></i> EDITAR</button>
              </div>
        <input type="hidden" class="id_incapacidad" value="${this.id_incapacidad}">
        <div class="row">
          <div class="col-md-6 mb-2">
            <label class="label-form">Días de incapacidad <span style="color: red;">*</span></label>
            <input type="number" class="form-control input-form border-required color-t dias_incapacidad desactivar" disabled value="${this.dias}" required="" name="dias_incapacidad" placeholder="Días de incapacidad...">
            <div class="invalid-feedback">Debe ingresar los días de incapacidad</div>
          </div>
          <div class="col-md-6 mb-2">
            <label for="fecha_inicio" class="label-form">Fecha de inicio <span style="color: red;">*</span></label>
            <input type="date" id="fecha_inicio" class="form-control input-form color-t border-required fecha_inicio desactivar" disabled value="${this.fecha_ini}" required="">
            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
          </div>
          <div class="col-md-6 mb-2">
            <label for="fecha_fin" class="label-form">Fecha final <span style="color: red;">*</span></label>
            <input type="date" class="form-control input-form color-t border-required fecha_fin desactivar" disabled value="${this.fecha_fin}" required="">
            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form">Diagnóstico <span style="color: red;">*</span></label>
            <input type="text" class="form-control input-form border-required color-t diagnostico desactivar" disabled value="${this.diagnostico}" name="diagnostico" required="" placeholder="Diagnóstico...">
            <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form" for="tipo_incapacidad">Tipo de incapacidad <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required tipo_incapacidad desactivar" disabled required>
              <option value="EG" ${this.tipo_incapacidad == 'EG' ? 'selected' : ''}>EG</option>
              <option value="AL" ${this.tipo_incapacidad == 'AL' ? 'selected' : ''}>AL</option>
              <option value="SOAT" ${this.tipo_incapacidad == 'SOAT' ? 'selected' : ''}>SOAT</option>
              <option value="LM" ${this.tipo_incapacidad == 'LM' ? 'selected' : ''}>LM</option>
              <option value="LP" ${this.tipo_incapacidad == 'LP' ? 'selected' : ''}>LP</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar la Tipo de incapacidad
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form">Adjuntar archivo <span style="color: red;">*</span></label>
            <input type="file" accept="application/pdf" class="form-control input-form border-required color-t archivo_incapacidad desactivar" disabled name="archivo_incapacidad" placeholder="Diagnóstico...">
            <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
          </div>
        </div>
      </div>
      <div class="col-md-12 mb-5 mt-1" style="flex-direction: row-reverse">
        <button class="btn color-button desactivar btnMakeSaldoinicla" disabled  style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
       </div>`;
        $('#incapacidades').append(incapacidades)
        if (i == caract && cedula != null) {
          incapacidades = `<div class="incapacidades secciones pb-3">
        <div class="row padding-secciones">
        <input type="hidden" class="id_incapacidad" value="">
        <div class="row">
          <div class="col-md-6 mb-2">
            <label class="label-form">Días de incapacidad <span style="color: red;">*</span></label>
            <input type="number" class="form-control input-form border-required color-t dias_incapacidad" value="${this.dias}" required="" name="dias_incapacidad" placeholder="Días de incapacidad...">
            <div class="invalid-feedback">Debe ingresar los días de incapacidad</div>
          </div>
          <div class="col-md-6 mb-2">
            <label for="fecha_inicio" class="label-form">Fecha de inicio <span style="color: red;">*</span></label>
            <input type="date" id="fecha_inicio" class="form-control input-form color-t border-required fecha_inicio" value="${this.fecha_ini}" required="">
            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
          </div>
          <div class="col-md-6 mb-2">
            <label for="fecha_fin" class="label-form">Fecha final <span style="color: red;">*</span></label>
            <input type="date" class="form-control input-form color-t border-required fecha_fin" value="${this.fecha_fin}" required="">
            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form">Diagnóstico <span style="color: red;">*</span></label>
            <input type="text" class="form-control input-form border-required color-t diagnostico" value="${this.diagnostico}" name="diagnostico" required="" placeholder="Diagnóstico...">
            <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form" for="tipo_incapacidad">Tipo de incapacidad <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required tipo_incapacidad" required>
              <option value="EG" ${this.tipo_incapacidad == 'EG' ? 'selected' : ''}>EG</option>
              <option value="AL" ${this.tipo_incapacidad == 'AL' ? 'selected' : ''}>AL</option>
              <option value="SOAT" ${this.tipo_incapacidad == 'SOAT' ? 'selected' : ''}>SOAT</option>
              <option value="LM" ${this.tipo_incapacidad == 'LM' ? 'selected' : ''}>LM</option>
              <option value="LP" ${this.tipo_incapacidad == 'LP' ? 'selected' : ''}>LP</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar la Tipo de incapacidad
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form">Adjuntar archivo <span style="color: red;">*</span></label>
            <input type="file" accept="application/pdf" class="form-control input-form border-required color-t archivo_incapacidad" name="archivo_incapacidad" placeholder="Diagnóstico...">
            <div class="invalid-feedback">Debe ingresar el Diagnostico.</div>
          </div>
        </div>
      </div>
      <div class="col-md-12 mb-5 mt-1" style="flex-direction: row-reverse">
        <button class="btn color-button btnMakeSaldoinicla"  style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
       </div></form>`;
          $('#incapacidades').append(incapacidades)
        }
        i++;
        // console.log(this)
      });
      // boton = `<button class="btn color-button " id="btnIrAtras" style="float:right" type="button"> IR ATRAS</button>`;
      // $('#btn_2').html(boton)
    }
  })
  // .always(function () {
  //   $('#btnBuscar').html('<i class="fa fa-eye"></i> BUSCAR').prop('disabled', false)
  //     .parents('form:first').removeClass('was-validated');

  // });


}

function readFile(file) {
  const reader = new FileReader();
  reader.onload = function () {
    editor.value = reader.result;
  }
  reader.readAsText(file);
}

function Eps() {
  $.post('ajaxGeneral.php?mode=eps')
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        // console.log(data);
        let sel = '<option value="" selected>Seleccione...</option>';
        if (data.error != undefined) {
          alert(data.error);
        } else {
          $.each(data, function () {
            sel += `<option value="${this.id_eps}">${this.eps}</option>`;
          });
        }
        $('#eps').html(sel);
      }
    })
}

function loadReporteEcxel() {
  var id_f = $("#id_funcionario").val();
  // if (filtro != '' && filtro != null) {
  newwindow = window.open("?view=reportes&mode=reporteincapacidadexcel&filtro=&todos=All&id_f=" + id_f, "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self
  }
}

function loadReportePDF() {
  var id_f = $("#id_funcionario").val();
  newwindow = window.open("?view=reportes&mode=reporteincapacidadpdf&filtro=&todos=All&id_f=" + id_f, "width=815,height=460")
  if (newwindow == null) {
    alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
  } else {
    newwindow.creator = self

  }
}

//