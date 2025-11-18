$(document).ready(function () {
  getFuncionarioAll();
  // getCapacitacion();
  $("#filterTable").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#tblFuncionariosAsignados tbody tr").filter(function () {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
    });
  });
  $(document).on("click", "#btnGuardar", function () {
    var frm = $(this).parents("form:first").addClass("was-validated");
    invalid = $(frm).find(".form-control:invalid").length;
    // Se continua al siguiente paso si el formulario no tiene datos invalidos
    if (invalid == 0) {
      $(this).html("Creando...").prop("disabled", true);
      guardarAsignacion();
    }
  });
  $(document).on("click", "input[name=selectedAll]", function () {
    if ($(this).is(":checked")) {
      $("input[name=selected]").prop("checked", true);
    } else {
      $("input[name=selected]").prop("checked", false);
    }
  });
    
  let showTrazabilidad = true;
  $(document).on("click", "#btnTrazabilidad", () => {
    if(showTrazabilidad){
      $(".hidden-info").addClass("d-none");
      $(".trazabilidad").removeClass("d-none");
      $("#trzText").text("OCULTAR TRAZABILIDAD");
      $("#btnEditar").hide();
      $("#btnPdf").hide();
      $("#btnExcel").hide();
      $("#btnEliminarActividad").hide();
      $(".show-info-traz").removeClass("d-none");
      showTrazabilidad = false;
    }else{
      $(".show-info-traz").addClass("d-none");  
      $(".hidden-info").removeClass("d-none");
      $(".trazabilidad").addClass("d-none");
      $("#trzText").text("VER TRAZABILIDAD");
      $("#btnEditar").show();
      $("#btnPdf").show();
      $("#btnExcel").show();
      $("#btnEliminarActividad").show();
      showTrazabilidad = true;
    }
    getTrazabilidad();
  });

  $(document).on("click", "button[name=limpiarFiltros]", function () {
    getFuncionarioAll(false)
    $("#tbl_funcionarios thead input[type=text]").val("");
  });
  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel();
  });
  $(document).on("click", "#btnPdf", function () {
    loadReportePDF();
  });
  $(document).on("click", "button[name=eliminarFuncionario]", function () {
    $(this).parents("tr").remove();
  });
  $(document).on("click", "input[name=asistioAll]", function () {
    if ($(this).is(":checked")) {
      $("input[name=asistio]").prop("checked", true);
    } else {
      $("input[name=asistio]").prop("checked", false);
    }
  });

  $(document).on("change", "#estado", function () {
    if ($(this).val() == "REALIZADO") {
      $("#trazabilidadData").show();
      $("#divMotivo").hide();
      $("#divAsignacionFuncionarios").show();
      $("#fecha_asignacion").attr("required", "");

      // $("#listaFUncionariosAsignados").hide();
    } else {
      $("#fecha_asignacion").removeAttr("required"); 
      $("#trazabilidadData").hide();
      $("#observacion").removeClass("border-required");
      var eliminarAsignacion = confirm(
        "Al cambiar el estado se eliminará la lista de usuarios asignados a esta capacitación. ¿Desea continuar?"
      );
      if (eliminarAsignacion) {
        $("#tblFuncionariosAsignados tbody tr").remove();
        $("#divMotivo").show();
        // $("#listaFUncionariosAsignados").hide();
        $("#divAsignacionFuncionarios").hide();
      } else {
        $(this).val("REALIZADO");
      }
    }

    if ($(this).val() == "SUSPENDIDO") {
      $("#content-date").removeClass("d-none");
      $("#fecha_inicio_suspencion").attr("required", true);
      $("#fecha_final_suspencion").attr("required", true);
    }else{
      $("#fecha_inicio_suspencion").removeAttr("required"); 
      $("#fecha_final_suspencion").removeAttr("required"); 
    }
  });

  $(document).on("click", "#btnEliminarCapacitacion", function () {
    var eliminarCapacitacionConfirm = confirm(
      "¿Está seguro que desea eliminar esta capacitación?"
    );
    if (eliminarCapacitacionConfirm) eliminarCapacitacion();
  });
  $(document).on("click", "#btnNuevo", function () {
    $("#identificacionActividad").val("").prop("disabled", false);
    $("#nombreActividad").val("").prop("disabled", false);
    $("#btnBuscar").prop("disabled", false);
    $("#tblFuncionariosAsignados tbody tr").remove();
    $("input[name=selectedAll]").prop("checked", false);
    $("input[name=selected]").prop("checked", false);
  });
  $(document).on("click", "#btnEditar", function () {
    $("input").prop("disabled", false);
    $("select").prop("disabled", false);
    $("textarea").prop("disabled", false);
    $("input[name=calificacion]").prop("disabled", false);
    $("button[name=eliminarFuncionario]").prop("disabled", false);
    $("#btnGuardar").prop("disabled", false);
    $("#btnBuscarFuncionarios").prop("disabled", false);
    $("#identificacion").prop("disabled", true);
  });
  $(document).on("change", "input[name=selected]", function () {
    $(this).each(function () {
      var documento = $(this).parents("tr").find("td[name=documento]").text();
      var cargo = $(this).parents("tr").find("td[name=cargo]").text();
      var sede = $(this).parents("tr").find("td[name=sede]").text();
      var codigo = $(this).parents("tr").find("td[name=codigo]").text();
      var id_funcionario = $(this)
        .parents("tr")
        .find("input[name=id_funcionario]")
        .val();
      var nombre = $(this).parents("tr").find("input[name=nombres]").val();
      var apellidos = $(this).parents("tr").find("input[name=apellidos]").val();
      var direccion = $(this).parents("tr").find("input[name=direccion]").val();
      var email = $(this).parents("tr").find("input[name=email]").val();
      var nivel = $(this).parents("tr").find("input[name=nivel]").val();
      var tipo_vinculacion = $(this)
        .parents("tr")
        .find("input[name=tipo_vinculacion]")
        .val();
      var tr = `<tr>
        <input type="hidden" name="id_funcionario" value=${id_funcionario}>
        <td>${documento}</td>
        <td>${nombre}</td>
        <td>${apellidos == "null" ? "" : apellidos} </td>
	      <td>${tipo_vinculacion}</td>
        <td>${nivel}</td>
        <td>${cargo}</td>
        <td>${sede}</td>
        <td>
          <select class="form-control" name="aprobo">
            <option selected value="">Seleccione una opción</option>
            <option value="1">Si</option>
            <option value="0">No</option>
          </select>
        </td>
        <td>
          <input type="number" class="form-control input-form color-t border-required" min="1" max="10" step="0.1" name="notaFunc" id="notaFunc" value="1" style="min-width: 75px;">
        </td>
        <td style="text-align:center">
        <button class="btn btn-danger btn-sm" name="eliminarFuncionario"><i class="fa fa-trash-o"></i></button>
        </td>
        </tr>`;
      $("#tblAsignarFuncionarios tbody").append(tr);
    });
  });
  $(document).on(
    "keypress",
    "#tbl_funcionarios thead input[type=text]",
    function (e) {
      var keycode = e.keyCode ? e.keyCode : e.which;
      if (keycode == "13") {
        // getFuncionarioAllFilter();
      }
    }
  );
});
function guardarAsignacion() {
  let funcionariosAsignados = [];
  var formData = new FormData();

  $("#tblAsignarFuncionarios tbody tr").each(function () {
    let id = $(this).find("input[name=id_funcionario]").val();
    fila = {
      id_funcionario: $(this).find("input[name=id_funcionario]").val() == "" ? "" : $(this).find("input[name=id_funcionario]").val(),
      aprobo: $(this).find("select[name=aprobo]").val(),
      nota: $(this).find("input[name=notaFunc]").val(),
    };
    console.log(fila);
    funcionariosAsignados.push(fila);
  });

  formData.append('is_update',"1");
  formData.append('identificacion', $("#identificacion").val());
  formData.append('nombre', $("#nombre").val());
  formData.append('fecha_inicio', $("#fecha_inicio").val());
  formData.append('fecha_finalizacion', $("#fecha_finalizacion").val());
  formData.append('modalidad', $("#modalidad").val());
  formData.append('direccion', $("#direccion").val());
  formData.append('horas_formativas', $("#horas_formativas").val());
  formData.append('conocimiento_previo', $("#conocimiento_previo").val());
  formData.append('fecha_asignacion', $("#fecha_asignacion").val());
  formData.append('entidadCapacitadora', $("#entidadCapacitadora").val());
  formData.append('calificacion' ,$("input[name=calificacion]:checked").val());
  formData.append('id_capacitacion' ,$("#id_capacitacion").val());
  formData.append('estado', $("#estado").val());
  formData.append('cantidad', $("#cantidadid").val());
  formData.append('archivo', $("#archivo")[0].files[0]);
  formData.append('motivo', $("#motivo").val());
  formData.append('fecha_inicio_suspencion', $("#fecha_inicio_suspencion").val());
  formData.append('fecha_final_suspencion', $("#fecha_final_suspencion").val());
  formData.append('funcionariosAsignados', JSON.stringify(funcionariosAsignados))

  $.ajax({
      type: 'POST',
      url: 'set/capacitacion/modificar',
      data: formData,
      contentType: false,
      processData: false,
      success: function (data) {
        if (data.trim() !== '') {
          data = JSON.parse(data);     
          if (data.error != undefined) {
            alertError(data.error);
            return
          }
          if (data.error_arc != undefined) {
            alertError(data.error_arc);
            return
          }
          if (data.success != undefined) {
            alertSucces(data.success)
          }
        }
      }  
    }).always(function () {
      $("#btnGuardar")
        .html('<i class="fa fa-save"></i> GUARDAR')
        .prop("disabled", false)
        .parents("form:first")
        .removeClass("was-validated");
    });

    if(checkLastState != $("#estado").val()){
      guardarTrazabilidad();
    }
}

document.addEventListener("keyup", e => {
  if(e.target.matches("#searchByIdentification")){
    hiddenShowDataFilter(e);
  }
  if(e.target.matches("#searchByDependencia")){
    hiddenShowDataFilter(e);
  }
  if(e.target.matches("#searchByPosition")){
    hiddenShowDataFilter(e);
  }
  if(e.target.matches("#searchByCampus")){
    hiddenShowDataFilter(e);
  }
  if(e.target.matches("#searchByName")){
    hiddenShowDataFilter(e);
  }
  if(e.target.matches("#searchByLastName")){
    hiddenShowDataFilter(e);
  }
});

function hiddenShowDataFilter(event){
  document.querySelectorAll(".element-data-filter").forEach(elements => {
    elements.textContent.toLowerCase().includes(event.target.value.toLowerCase())
    ?elements.classList.remove("d-none")
    :elements.classList.add("d-none")	
  });
}

function eliminarCapacitacion() {
  data = {
    id_capacitacion: $("#id_capacitacion").val(),
  };
  $.post("set/capacitacion/eliminar", {
    general: JSON.stringify(data),
  })
    .done(function (data) {
      if (data.trim() !== "") {
        data = JSON.parse(data);
        // objMsjAJX.sel['msj'] = "#MsjAJX";
        if (data.error != undefined) {
          alertError(data.error);
          return;
        }
        if (data.success != undefined) {
          alertSucces(data.success);
        }
      }
    })
    .always(function () {
      $("#btnGuardar")
        .html('<i class="fa fa-save"></i> GUARDAR')
        .prop("disabled", false)
        .parents("form:first")
        .removeClass("was-validated");
    });
}

function getFuncionarioAll(flag = true) {
  $.post("ajaxGeneral.php?mode=funcionariosAll")
    .done(function (data) {
      if (data.trim() !== "") {
        // data.replace("getFuncionario", 'ss')
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(data.error);
          return;
        }
        var tr = "";
        $(data).each(function () {
          tr += `<tr class="element-data-filter">
            <th scope="col"><input type="checkbox" name="selected"></th>
            <input type="hidden" name="id_funcionario" value="${this.id_funcionario}">
            <input type="hidden" name="nombres" value="${this.nombre}">
            <input type="hidden" name="apellidos" value="${this.apellidos}">
            <input type="hidden" name="direccion" value="${this.direccion}">
            <input type="hidden" name="email" value="${this.email}">
            <input type="hidden" name="tipo_vinculacion" value="${this.tipo_vinculacion}">
            <input type="hidden" name="nivel" value="${this.nivel}">
            <td scope="col" name="documento">${this.documento}</td>
            <td scope="col" name="nombre">${this.nombre === null ? "" :  this.nombre}</td>
            <td scope="col" name="apellidos">${this.apellidos === null ? "" :  this.apellidos}</td>
            <td scope="col" name="dependencia">${this.dependencia}</td>
            <td scope="col" name="cargo">${this.cargo === null ? "" : this.cargo}</td>
            <td scope="col" name="sede">${this.sede === null ? "" : this.sede}</td>
            </tr>`;
        });
        $("#tbl_funcionarios tbody").html(tr);
        if(flag)
        getCapacitacion();
      }
    })
    .always(function () {
      $("#btnBuscar")
        .html('<i class="fa fa-eye"></i> BUSCAR')
        .prop("disabled", false)
        .parents("form:first")
        .removeClass("was-validated");
    });
}

function getFuncionarioAllFilter() {
  $.post("ajaxGeneral.php?mode=funcionariosAllFilter", {
    documento: $("#documento").val(),
    sede: $("#sede").val(),
    cargo: $("#cargo").val(),
    codigo: $("#codigo").val(),
  })
    .done(function (data) {
      if (data.trim() !== "") {
        // data.replace("getFuncionario", 'ss')
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(data.error);
          return;
        }
        var tr = "";
        $(data).each(function () {
          tr += `<tr>
          <th scope="row"><input type="checkbox" name="selected"></th>
          <input type="hidden" name="id_funcionario" value='"${this.id_funcionario}"'>
          <input type="hidden" name="nombres" value='${this.nombre}'>
          <input type="hidden" name="apellidos" value='${this.apellidos}'>
          <input type="hidden" name="direccion" value='${this.direccion}'>
          <input type="hidden" name="email" value='${this.email}'>
          <td name="documento">${this.documento}</td>
          <td name="codigo">${this.codigo}</td>
          <td name="cargo">${this.cargo === null ? "" : this.cargo}</td>
          <td name="sede">${this.sede === null ? "" : this.sede}</td>
      </tr>`;
        });
        $("#tbl_funcionarios tbody").html(tr);
      }
    })
    .always(function () {
      $("#btnBuscar")
        .html('<i class="fa fa-eye"></i> BUSCAR')
        .prop("disabled", false)
        .parents("form:first")
        .removeClass("was-validated");
    });
}

function getCapacitacion() {
  let params = new URLSearchParams(location.search);
  var id_capacitacion = params.get("id_capacitacion");
  $.post("ajaxGeneral.php?mode=getCapacitacion", {
    id_capacitacion: id_capacitacion,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error != undefined) {
        alertError(data.error);
        return;
      }
      var trFuncionarios;
      $(data).each(function () {
        checkLastState = this.estado;
        $("#identificacionTrazabilidad").val(this.identificacion).prop("disabled", true);
        $("#nombreTrazabilidad").val(this.nombre).prop("disabled", true);
        $("#id_capacitacion").val(this.id_capacitacion);
        $("#identificacion").val(this.identificacion).prop("disabled", true);
        $("input[name=calificacion][value="+this.calificacion+"]").prop("checked", true)
        $("input[name=calificacion]").prop("disabled", true);
        $("#nombre").val(this.nombre).prop("disabled", true);
        $("#observacion").val(this.observacion).prop("disabled", true);
        $("#cantidadid").val(this.cantidad).prop("disabled", true);
        $("#fecha_inicio").val(this.fecha_ini).prop("disabled", true);
        $("#fecha_finalizacion").val(this.fecha_fin).prop("disabled", true);
        $("#modalidad").val(this.is_presencial).prop("disabled", true);
        $("#direccion").val(this.direccion).prop("disabled", true);
        $("#fecha_inicio_suspencion").val(this.fecha_inicio_suspencion).prop("disabled", true)
        $("#fecha_final_suspencion").val(this.fecha_final_suspencion).prop("disabled", true)
        $("#entidadCapacitadora")
          .val(this.entidadCapacitadora)
          .prop("disabled", true);
        $("#horas_formativas")
          .val(this.horas_formativas)
          .prop("disabled", true);
        $("#conocimiento_previo")
          .val(this.conocimiento_previo)
          .prop("disabled", true);
        if (this.estado != "REALIZADO") $("#divMotivo").show();
        $("#estado").val(this.estado);
        // if ($("#estado").val() != null) $("#estado").trigger("change");
        $("#motivo").val(this.motivo);
        // $("#archivo").val(this.archivo);
        if (this.funcionarios.length > 0) {
          // $("#listaFUncionariosAsignados").show();
          $("#divAsignacionFuncionarios").show();
        }
        if(this.estado == "REALIZADO"){
          $("#trazabilidadData").show();
          $("#fecha_asignacion").attr("required", "");
          $("#divAsignacionFuncionarios").show("");
          $("#fecha_asignacion").attr("required", "");
        }else{
          $("#trazabilidadData").hide();
        }

        if(this.estado == ""){
          $("#divMotivo").hide();
        }
        
        if(this.estado == 'SUSPENDIDO'){
          $("#content-date").removeClass("d-none");
          $("#fecha_inicio_suspencion").attr("required", true);
          $("#fecha_final_suspencion").attr("required", true);
        }else{
          $("#fecha_inicio_suspencion").removeAttr("required"); 
          $("#fecha_final_suspencion").removeAttr("required"); 
        }

        $(this.funcionarios).each(function () {
          trFuncionarios += `<tr>
              <input type="hidden" name="id_capacitacion_funcionario" value=${this.id_capacitacion_funcionario}>
              <input type="hidden" name="id_funcionario" value=${this.id_funcionario}>
              <td>${this.documento}</td>
              <td>${this.nombre}</td>
              <td>${this.apellidos === null ? "" :  this.apellidos}</td>
              <td>${this.tipo_vinculacion}</td>
              <td>${this.nivel}</td>
              <td>${this.cargo === null ? "" : this.cargo}</td>
              <td>${this.sede === null ? "" : this.sede}</td>
              <td>
                  <select class="form-control" name="aprobo" disabled>
                    ${
                    this.aprobo === null || "" ? 
                    `<option selected value="">Seleccione una opción</option>
                    <option value="1">Si</option>
                    <option value="0">No</option>`
                    : this.aprobo === 1 ? 
                    `<option value="">Seleccione una opción</option>
                    <option value="1" selected>Si</option>
                    <option value="0">No</option>`
                    : `<option value="">Seleccione una opción</option>
                    <option value="1">Si</option>
                    <option value="0" selected>No</option>`}
                  </select>
              </td>
              <td>
                <input type="number" class="form-control input-form color-t border-required" disabled min="1" max="10" step="0.1" name="notaFunc" id="notaFunc" value="${ this.nota }" style="min-width: 75px;">
              </td>
              <td style="text-align:center">
                <button class="btn btn-danger btn-sm" disabled name="eliminarFuncionario"><i class="fa fa-trash-o"></i></button>
              </td>
              </tr>`;
          $("#tbl_funcionarios tbody tr")
            .find(
              "input[name=id_funcionario][value=" + this.id_funcionario + "]"
            )
            .parents("tr")
            .find("input[name=selected]")
            .prop("checked", true);
          $("#fecha_asignacion").val(this.fecha_asignacion);
        });
      });
      $("#tblAsignarFuncionarios tbody").html(trFuncionarios);
    }
  });
}

function loadReporteEcxel() {
  let params = new URLSearchParams(location.search);
  var id_capacitacion = params.get('id_capacitacion');
  // if (filtro != '' && filtro != null) {
   newwindow = window.open("?view=reportes&mode=consultacapacitacionbyIdexcel&id_capacitacion="+id_capacitacion, "width=815,height=460")
   if (newwindow == null) {
     alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
   } else {
     newwindow.creator = self
   }
 }
 
 function loadReportePDF() {
  let params = new URLSearchParams(location.search);
  var id_capacitacion = params.get('id_capacitacion');
   newwindow = window.open("?view=reportes&mode=consultacapacitacionByIdPdf&id_capacitacion="+id_capacitacion, "width=815,height=460")
   if (newwindow == null) {
     alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
   } else {
     newwindow.creator = self
 
   }
 }

 function getTrazabilidad() {
  let params = new URLSearchParams(location.search);
  var id_capacitacion = params.get("id_capacitacion");
  var trTrazabilidad;
  $.post( "ajaxGeneral.php?mode=getAsignacionFuncionariosCapacitacionesTrazabilidad", { 
    id_capacitacion: id_capacitacion
  }).done(function( data ) {
      if (data.trim() !== "") {
          data = JSON.parse(data);
          if (data.error != undefined) {
              alertError(data.error);
              return;
          }
          if(data.length == 0){
            trTrazabilidad += `
            <tr>
              <td colspan="6" style="text-align:center;">
                Sin cambios registrados
              </td>
            </tr>
            `;
          }else{ 
            $(data).each(function () {
              trTrazabilidad += `<tr>
              $("#divRecursos").removeClass("col-md-6");
                <td name="tiempo_gen">${ this.tiempo_gen == null || "" ? "" : this.tiempo_gen.slice(0, -9)}</td>
                <td name="estado">${ this.estado == null || "" ? "" : this.estado}</td>
                <td name="observacion">${ this.observacion == null || "" ? "Sin observaciones o Motivos" : this.observacion}</td>
                <td name="fecha_inicio_suspencion">${ this.fecha_inicio_suspencion == null || "" ? "No Aplica" : this.fecha_inicio_suspencion}</td>
                <td name="fecha_final_suspencion">${ this.fecha_final_suspencion == null || "" ? "No Aplica" : this.fecha_final_suspencion}</td>
              </tr>`;              
            });
          }
          $("#asignacionFuncionariosCapacitaciones tbody").html(trTrazabilidad);
      }
      
  });
}

function guardarTrazabilidad() {
  let estado = $("#estado").val();
  let fecha_inicio_suspencion;
  let fecha_final_suspencion = $("#fecha_final_suspencion").val();
  let observacion;

  if(estado == 'REALIZADO'){
    observacion = $("#observacion").val();
  }else{
    observacion = $("#motivo").val();
  }

  if(estado != 'SUSPENDIDO'){
    fecha_inicio_suspencion = "";
    fecha_final_suspencion = "";
  }else{
    fecha_inicio_suspencion = $("#fecha_inicio_suspencion").val();
    fecha_final_suspencion = $("#fecha_final_suspencion").val();
  }

  let params = new URLSearchParams(location.search);
  var id_capacitacion = params.get("id_capacitacion");
  data = {
    id_capacitacion: id_capacitacion,
    estado: $("#estado").val(),
    observacion: observacion,
    calificacion: $("input[name=calificacion]:checked").val(),
    fecha_inicio_suspencion: fecha_inicio_suspencion,
    fecha_final_suspencion: fecha_final_suspencion
  };

  $.post("set/capacitacion/trazabilidad", {
    general: JSON.stringify(data)
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // objMsjAJX.sel['msj'] = "#MsjAJX";
      if (data.error != undefined) {
        alertError(data.error);
        return;
      }
      if (data.success != undefined) {
        alertSucces(data.success);
      }
    }
  })

}//