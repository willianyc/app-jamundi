$(document).ready(function () {
    $("#btnEliminarActividad").prop("disabled", true);
    getFuncionarioAll();
    selectCargo()
    // getCapacitacionAsignacion();
    $(document).on("click", "#btnGuardar", function () {
      var frm = $(this).parents("form:first").addClass("was-validated");
      invalid = $(frm).find(".form-control:invalid").length;
      // Se continua al siguiente paso si el formulario no tiene datos invalidos
      if (invalid == 0) {
        $(this).html("Creando...").prop("disabled", true);
        guardarAsignacion();
      }
    });
    $("#filterTable").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      $("#tblFuncionariosAsignados tbody tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      });
    });
    $(document).on('changed.bs.select','#grupoObjetivo', function (e, clickedIndex, isSelected, previousValue) {
      getFuncionarioAllFilter()
    });    
    $(document).on("change", "#recursos", function () {
      //Majjul
      let div = $("#divRecursos");
      if ($(this).val() =="FINANCIERO" || $(this).val() =="AMBOS"){
        // Majull
        div.removeClass('col-md-6');
        div.addClass('col-md-3');
        $("#divValorTotal").show();
      } else {
        $("#divValorTotal").hide();
        // Majull
        div.removeClass('col-md-3');
        div.addClass('col-md-6');
      }
    });

    // Majjul
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

    $(document).on("click", "input[name=selectedAll]", function () {
      if ($(this).is(":checked")) {
        $("input[name=selected]").prop("checked", true);
      } else {
        $("input[name=selected]").prop("checked", false);
      }
    });
    $(document).on("change", "#estado", function () {
      if ($(this).val() == "REALIZADO") {
        $("#divMotivo").hide();
        //Majjul
        $("#fecha_asignacion").attr("required", true);
        $("#divAsignacionFuncionarios").show();
      } else {
        $("#fecha_asignacion").attr("required", false);
        var eliminarAsignacion = confirm(
          "Al cambiar el estado se eliminará la lista de usuarios asignados a esta capacitación. ¿Desea continuar?"
        );
        if (eliminarAsignacion) {
          $("#tblFuncionariosAsignados tbody tr").remove();
          $("#divMotivo").show();
          $("#divAsignacionFuncionarios").hide();
        } else {
          $(this).val("REALIZADO");
        }
      }
    });
    //majjul
    $(document).on("change", "#estado", function (){      
      let option = $(this).val();
      if(option == "REALIZADO"){
        $("#content-estado").removeClass("col-md-12");
        $("#content-estado").addClass("col-md-6");
        $("#bloqArchivo").removeClass("d-none");
        $("#content-date").addClass("d-none");
        $("#fecha_inicio_suspencion").prop("required", false);
        $("#fecha_final_suspencion").prop("required", false);
        // $("#content-fecha").removeClass("d-none");
	      $("#divObservacion").show();
	      $("#divMotivo").hide();
      }
      else if(option == "SUSPENDIDO"){
        $("#content-estado").removeClass("col-md-6");
        $("#content-estado").addClass("col-md-12");
        $("#bloqArchivo").addClass("d-none");
        $("#content-fecha").addClass("d-none");
        $("#content-date").removeClass("d-none");
        $("#fecha_inicio_suspencion").prop("required", true);
        $("#fecha_final_suspencion").prop("required", true);
	      $("#divObservacion").hide();
	      $("#divMotivo").show();
      }
      else if(option == "CANCELADO"){
        $("#content-estado").removeClass("col-md-6");
        $("#content-estado").addClass("col-md-12");
        $("#bloqArchivo").addClass("d-none");
        $("#fecha_inicio_suspencion").prop("required", false);
        $("#fecha_final_suspencion").prop("required", false);
        // $("#content-fecha").removeClass("d-none");
        $("#content-date").addClass("d-none");
	      $("#divObservacion").hide();
	      $("#divMotivo").show();
      }
	    else if(option == ""){
        $("#content-estado").removeClass("col-md-6");
        $("#content-estado").addClass("col-md-12");
        $("#bloqArchivo").addClass("d-none");
	      $("#fecha_inicio_suspencion").prop("required", false);
 	      $("#fecha_final_suspencion").prop("required", false);
	      $("#content-date").addClass("d-none");
 	      $("#content-fecha").addClass("d-none");
	      $("#divMotivo").hide();
        $("#divObservacion").hide();
	    }
    });
    $(document).on("click", "input[name=asistioAll]", function () {
      if ($(this).is(":checked")) {
        $("input[name=asistio]").prop("checked", true);
      } else {
        $("input[name=asistio]").prop("checked", false);
      }
    });
    $(document).on("click", "button[name=limpiarFiltros]", function () {
      $("#tbl_funcionarios thead input[type=text]").val("");
      getFuncionarioAll();
    });
    $(document).on("click", "button[name=eliminarFuncionario]", function () {
      $(this).parents("tr").remove();
    });
    $(document).on("click", "#btnEliminarActividad", function () {
      var eliminarActividadConfirm = confirm(
        "¿Está seguro que desea eliminar esta capacitacion?"
      );
      if (eliminarActividadConfirm) eliminarActividad();
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
	//Majjul
      $("input").prop("disabled", false);
      $("select").prop("disabled", false);
      $("textarea").prop("disabled", false);
      $("button[name=eliminarFuncionario]").prop("disabled", false);
      $("#btnGuardar").prop("disabled", false);
      $("#btnBuscarFuncionarios").prop("disabled", false);
      $("input[type=checkbox]").prop("disabled", false);
      $("#identificacion").prop("disabled", true);
      $("#grupoObjetivo").prop("disabled", false);
      $("#grupoObjetivo").selectpicker("refresh")
    });
    $(document).on("click", "button[name=mdlAceptar]", function () {
      $("#tblAsignarFuncionarios tbody tr").remove();
      $("input[name=selected]:checked").each(function () {
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
          <td>${documento == "null"? "":documento}</td>
          <td>${nombre == "null"? "":nombre}</td>
          <td>${apellidos == "null"? "":apellidos}</td>
	    <!-- Majjul -->
	    <!--
          <td>${tipo_vinculacion == "null"? "":tipo_vinculacion}</td>
          <td>${nivel == "null"? "":nivel}</td> -->
          <td>${cargo == "null"? "":cargo}</td>
          <td>${sede == "null"? "":sede}</td>
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
    // Majjul
    // $(document).on(
    // "keypress",
    // "#tbl_funcionarios thead input[type=text]",
    // function (e) {
    // var keycode = e.keyCode ? e.keyCode : e.which;
    // if (keycode == "13") {
    //   getFuncionarioAllFilter();
    //   }
    //  }
    // );
	
    //Majjul
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
  });
  
  let checkLastState;
  function guardarAsignacion() {
    let funcionariosAsignados = [];
    let arrayGrupoObjetivo = [];
    let grupoObjetivo = $("#grupoObjetivo").val();
    $("#tblAsignarFuncionarios tbody tr").each(function () {
      fila = {
        asistio: Number($(this).find("input[name=asistio]").is(":checked")),
        id_capacitacionprogramadasfuncionario: $(this).find("input[name=id_capacitacionprogramadasfuncionario]").val(),
        //Majjul
        id_funcionario: $(this).find("input[name=id_funcionario]").val() == "" ? "" : $(this).find("input[name=id_funcionario]").val(),
        aprobo: $(this).find("select[name=aprobo]").val(),
        nota: $(this).find("input[name=notaFunc]").val(),
      };
      funcionariosAsignados.push(fila);
    });
    $(grupoObjetivo).each(function(){
      fila = {
        id_cargo: this[0]
      }
      arrayGrupoObjetivo.push(fila);
    })

    data = {
      id_capacitacion: $("#id_capacitacion").val(),
      identificacion: $("#identificacion").val(),
      nombre: $("#nombre").val(),
      fecha_inicio: $("#fecha_inicio").val(),
      fecha_finalizacion: $("#fecha_finalizacion").val(),
      modalidad: $("#modalidad").val(),
      direccion: $("#direccion").val(),
      grupoObjetivo: $("#grupoObjetivo").val(),
      recursos: $("#recursos").val(),
      valorTotal: $("#valorTotal").val(),
      entidad: $("#entidad").val(),
      archivo: $("#archivo").val(),
      fecha_asignacion: $("#fecha_asignacion").val(),
      motivo: $("#motivo").val(),
      observacion: $("#observacion").val(),
      estado: $("#estado").val(),
      gruposObjetivo: arrayGrupoObjetivo,
      funcionariosAsignados: JSON.stringify(funcionariosAsignados),
	    //Majjul
	    fecha_inicio_suspencion: $("#fecha_inicio_suspencion").val(),
      fecha_final_suspencion: $("#fecha_final_suspencion").val(),
      fecha_: $("#fecha_").val(),
    };
    $.post("set/capacitacionesProgramadas/modificar", {
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
      
      if(checkLastState != $("#estado").val()){
        guardarTrazabilidad();
      }
  }
  
  function getCapacitacionAsignacion() {
    let params = new URLSearchParams(location.search);
    var id_capacitacion = params.get("id_capacitacion");
    $.post("ajaxGeneral.php?mode=getCapacitacionesProgramadasAsignacion", {
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
          $("#id_capacitacion").val(this.id_capacitacionprogramada);
          $("#identificacion").val(this.identificacion).prop("disabled", true);
          $("input[name=calificacion][value="+this.calificacion+"]").prop("checked", true)
          $("#recursos option[value="+this.recursos+"]").prop("selected", true)
          $("#recursos").prop("disabled", true)
          $("#valorTotal").val(this.valor_total).prop("disabled", true);
          $("input[name=calificacion]").prop("disabled", true);
          $("#nombre").val(this.nombre).prop("disabled", true);
          $("#fecha_inicio").val(this.fecha_ini).prop("disabled", true);
          $("#fecha_finalizacion").val(this.fecha_fin).prop("disabled", true);
          $("#modalidad").val(this.is_presencial).prop("disabled", true);
          $("#direccion").val(this.direccion).prop("disabled", true);
          $("#horas_formativas")
            .val(this.horas_formativas)
            .prop("disabled", true);
          $("#entidad").val(this.entidad_actividad).prop("disabled", true);
          $("#estado").val(this.estado);
          $("#observacion").val(this.observacion);
	      // Majjul
	        if($("#estado").val() == "SUSPENDIDO"){
		        $("#divMotivo").show();
           	$("#content-date").removeClass("d-none");
	          $("#motivo").val(this.motivo).prop("disabled", true);
            $("#fecha_inicio_suspencion").val(this.fecha_inicio_suspencion).prop("disabled", true);
            $("#fecha_final_suspencion").val(this.fecha_final_suspencion).prop("disabled", true);
	        }else if($("#estado").val() == "REALIZADO"){
            $("#content-estado").removeClass("col-md-12");
            $("#content-estado").addClass("col-md-6");
            $("#bloqArchivo").removeClass("d-none");
            // $("#content-fecha").removeClass("d-none");
		        $("#fecha_").val(this.fecha_).prop("disabled", true);
		        $("#divObservacion").show();
            // Majjul
            $("#divAsignacionFuncionarios").show()
	        }else if($("#estado").val() == "CANCELADO"){
           	// $("#content-fecha").removeClass("d-none");
		        $("#fecha_").val(this.fecha_).prop("disabled", true);
		        $("#divMotivo").show();
	        }
          // $("#archivo").val(this.archivo);
          if ($("#estado").val() == "REALIZADO")
           $("#divObservacion").show();
          this.recursos == "FINANCIERO" || this.recursos == "AMBOS"
           $("#divValorTotal").show();
           // Majjul
          if(this.recursos == "ADMINISTRATIVO"){
           $("#divValorTotal").hide();
           $("#divRecursos").removeClass("col-md-3");
           $("#divRecursos").addClass("col-md-6");
          }else{
             let div = $("#divRecursos");
             div.removeClass("col-md-6");
             div.addClass("col-md-3");
          }

          $("#motivo").val(this.motivo);
          if (this.funcionarios.length > 0) {
            $("#listaFUncionariosAsignados").show();
            $("#divAsignacionFuncionarios").show();
          }
          $(this.funcionarios).each(function () {
            trFuncionarios += `<tr>
                <input type="hidden" name="id_capacitacionprogramadasfuncionario" value=${this.id_capacitacionprogramadasfuncionario}>
                <input type="hidden" name="id_funcionario" value=${this.id_funcionario}>
                <td>${this.documento == null ? "" : this.documento}</td>
                <td>${this.nombre == null ? "" : this.nombre}</td>
                <td>${this.apellidos == null ? "" : this.apellidos}</td>
          	    <!-- <td>${this.tipo_vinculacion == null ? "" :this.tipo_vinculacion}</td>
          	    <td>${this.nivel == null ? "":nivel}</td> -->
                <td>${this.cargo == null ? "" : this.cargo}</td>
                <td>${this.sede == null ? "" : this.sede}</td>
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
                <td>
                <input type="checkbox" disabled  name="asistio" ${this.asistencia == 0 ? "" : "checked"}>
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
          var arrayGrupoObjetivo = []
          $(this.grupo_objetivo).each(function () {
            arrayGrupoObjetivo.push(this.id_cargo)
          })
          $("#grupoObjetivo").selectpicker(arrayGrupoObjetivo)
          selectCargo(arrayGrupoObjetivo)
        });
        $("#tblAsignarFuncionarios tbody").html(trFuncionarios);
      }
    });
  }
  function selectCargo(arrayGrupoObjetivo = null) {
    $.post('ajaxGeneral.php?mode=cargo')
      .done(function (data) {
        if (data.trim() !== '') {
          data = JSON.parse(data);
          if (data.error != undefined) {
            // objMsjAJX.showError(data.error)
            return
          }
          // options = '<option selected>Seleccione...</option>';
          options = '';
          $(data).each(function () {
            options += '<option value="' + this.id_cargo + '" cargo="' + this.cargo + '">' + this.cargo + '</option>'
          })
  
          $('#grupoObjetivo').html(options)
          $('#grupoObjetivo').selectpicker('refresh')
          $('div.filter-option-inner-inner').html("Seleccione el cargo")
          if(arrayGrupoObjetivo != null)
            $('#grupoObjetivo').selectpicker('val',arrayGrupoObjetivo)
        }
      })
  }
  function eliminarActividad() {
    data = {
      id_capacitacion: $("#id_capacitacion").val(),
    };
    $.post("set/capacitacionesProgramadas/eliminar", {
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
  function getFuncionarioAll() {
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
            <th scope="row"><input type="checkbox" name="selected"></th>
            <input type="hidden" name="id_funcionario" value="${this.id_funcionario}">
            <input type="hidden" name="nombres" value="${this.nombre}">
            <input type="hidden" name="apellidos" value="${this.apellidos}">
            <input type="hidden" name="direccion" value="${this.direccion}">
            <input type="hidden" name="email" value="${this.email}">
            <input type="hidden" name="tipo_vinculacion" value="${this.tipo_vinculacion}">
            <input type="hidden" name="nivel" value="${this.nivel}">
            <td name="documento">${this.documento}</td>
		        <!-- Majjul -->
		        <td name="nombre">${this.nombre}</td>
		        <td name="apellidos">${this.apellidos}</td>
            <td name="tipo_vinculacion">${this.dependencia}</td>
            <td name="cargo">${this.cargo}</td>
            <td name="sede">${this.sede}</td>
            </tr>`;
          });
          $("#tbl_funcionarios tbody").html(tr);
          getCapacitacionAsignacion();
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
    let arrayGrupoObjetivo = [];
    let grupoObjetivo = $("#grupoObjetivo").val();
    $(grupoObjetivo).each(function(){
      fila = {
        id_cargo: this[0]
      }
      arrayGrupoObjetivo.push(fila);
    })
    $.post("ajaxGeneral.php?mode=funcionariosAllFilter", {
      documento: $("#documento").val(),
      sede: $("#sede").val(),
      cargo: $("#cargo").val(),
      codigo: $("#codigo").val(),
      grupoObjetivo: arrayGrupoObjetivo,
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
                <input type="hidden" name="id_funcionario" value="${this.id_funcionario}">
                <input type="hidden" name="nombres" value="${this.nombre}">
                <input type="hidden" name="apellidos" value="${this.apellidos}">
                <input type="hidden" name="direccion" value="${this.direccion}">
                <input type="hidden" name="email" value="${this.email}">
                <input type="hidden" name="tipo_vinculacion" value="${this.tipo_vinculacion}">
                <input type="hidden" name="nivel" value="${this.nivel}">
                <td name="documento">${this.documento}</td>
                <td name="codigo">${this.codigo}</td>
                <td name="cargo">${this.cargo}</td>
                <td name="sede">${this.sede}</td>
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
  function getActividad() {
    $.post("ajaxGeneral.php?mode=getActividad", {
      documento: $("#identificacionActividad").val(),
      nombre: $("#nombreActividad").val(),
    }).done(function (data) {
      if (data.trim() !== "") {
        // data.replace("getFuncionario", 'ss')
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(data.error);
          return;
        }
        $(data).each(function () {
          $("#id_actividad").val(this.id_actividad);
          $("#identificacionActividad")
            .val(this.identificacion)
            .prop("disabled", true);
          $("#nombreActividad").val(this.nombre).prop("disabled", true);
          $("#btnBuscar").prop("disabled", true);
        });
      }
    });
  }
  
  function hiddenShowDataFilter(event){
    document.querySelectorAll(".element-data-filter").forEach(elements => {
      elements.textContent.toLowerCase().includes(event.target.value.toLowerCase())
      ?elements.classList.remove("d-none")
      :elements.classList.add("d-none")	
    });
  }

  function guardarTrazabilidad() {
    let estado = $("#estado").val();
    let fecha_ = $("#fecha_").val()
    let fecha_inicio_s = $("#fecha_inicio_suspencion").val()
    let fecha_final_s = $("#fecha_final_suspencion").val()

    let observacion;

    if(estado == "CANCELADO" || estado == "SUSPENDIDO"){
      $("#observacion").val("");
    }else if(estado == "REALIZADO"){
      $("#motivo").val("");
    }else{
      $("#motivo").val("");
      $("#observacion").val("");
    }
    
    if($("#motivo").val()){
      observacion = $("#motivo").val();
    }else{
      observacion = $("#observacion").val();
    }

    if(estado == "SUSPENDIDO"){
      fecha_ = "";
    }else if(estado == "REALIZADO" || estado == "CANCELADO"){
      fecha_final_s = "";
      fecha_inicio_s = "";
    }else{
      fecha_ = "";
      fecha_final_s = "";
      fecha_inicio_s = "";
    }
    data = {
      id_capacitacionprogramada: $("#id_capacitacion").val(),
      estado: $("#estado").val(),
      observacion: observacion,
      fecha_inicio_suspencion: fecha_inicio_s,
      fecha_final_suspencion: fecha_final_s,
      fecha_: fecha_,
    };
    $.post("set/capacitacionesProgramadas/trazabilidad", {
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

  }

  function getTrazabilidad() {
    let params = new URLSearchParams(location.search);
    var id_capacitacion = params.get("id_capacitacion");
    var trTrazabilidad;
    $.post( "ajaxGeneral.php?mode=getCapacitacionesProgramadasTrazabilidad", { 
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
                <td name="observacion">${ this.observacion == null || " " ? "Sin observaciones" : this.observacion}</td>
                <td name="fecha_inicio_suspencion">${ this.fecha_inicio_suspencion == null || "" ? "No aplica" : this.fecha_inicio_suspencion}</td>
                <td name="fecha_final_suspencion">${ this.fecha_final_suspencion == null || "" ? "No aplica" : this.fecha_final_suspencion}</td>
                <!-- <td name="fecha_">${ this.fecha_ == null || "" ? "Pendiente" : this.fecha_}</td> -->
                </tr>`;              
              });
            }
            $("#trazabilidadCapacitacionesProgramadas tbody").html(trTrazabilidad);
        }
        
    });
  }

  $(document).on("click", "#btnExcel", function () {
    loadReporteEcxel();
  });

  function loadReporteEcxel() {
    let params = new URLSearchParams(location.search);
    var id_capacitacion = params.get('id_capacitacion');
    // if (filtro != '' && filtro != null) {
     newwindow = window.open("?view=reportes&mode=asignacionFuncionariosCapacitacionesProgramadasByIdexcel&id_capacitacion="+id_capacitacion, "width=815,height=460")
     if (newwindow == null) {
       alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
     } else {
       newwindow.creator = self
     }
  }//