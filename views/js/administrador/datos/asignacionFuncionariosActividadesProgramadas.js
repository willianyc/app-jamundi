$(document).ready(function () {
    getFuncionarioAll();
    // getActividadAsignacion();
    
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
    
    $(document).on("change", "#recursos", function () {
      if ($(this).val() =="FINANCIERO" || $(this).val() =="AMBOS"){
        $("#divValorTotal").show();
        $("#bloqRecurso").removeClass("col-md-8");
        $("#bloqRecurso").addClass("col-md-4");
      } else {
        $("#divValorTotal").hide();
        $("#bloqRecurso").removeClass("col-md-4");
        $("#bloqRecurso").addClass("col-md-8");
        $("#valorTotal").val("0");
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
    
    //majjul
    
    $("#btnEliminarActividad").prop("disabled", true);

    $(document).on("change", "#estado", function (){
      
      let option = $(this).val();
      if(option === "REALIZADO"){
        // $("#fecha_asignacion").prop("required", true);
        // $("#divAsignacionFuncionarios").show();
        $("#bloqArchivo").removeClass("d-none");
        $("#content-date").addClass("d-none")
        $("#fecha_inicio_suspencion").prop("required", false);
        $("#fecha_final_suspencion").prop("required", false);
        // $("#content-fecha").removeClass("d-none");
        $("#bloqArchivo").removeClass("col-md-12");
        $("#bloqArchivo").addClass("col-md-6");

        $("#fecha_inicio_suspencion").val("");
        $("#fecha_final_suspencion").val("");

        $("#divObservacion").show();

      }
      else if(option === "SUSPENDIDO"){
        $("#bloqArchivo").addClass("d-none");
        $("#content-fecha").addClass("d-none");
        $("#content-date").removeClass("d-none");
        $("#fecha_inicio_suspencion").prop("required", true);
        $("#fecha_final_suspencion").prop("required", true);
        $("#bloqArchivo").removeClass("col-md-6");
        $("#bloqArchivo").addClass("col-md-12");
        $("#divObservacion").show();
        $("#fecha_asignacion").prop("required", false);
        $("#listaFUncionariosAsignados").hide();
        // $("#divAsignacionFuncionarios").hide();
        
      }
      else if(option === "CANCELADO"){
        $("#bloqArchivo").addClass("d-none");
        $("#fecha_inicio_suspencion").prop("required", false);
        $("#fecha_final_suspencion").prop("required", false);
        // $("#content-fecha").removeClass("d-none");
        $("#content-date").addClass("d-none");
        $("#bloqArchivo").removeClass("col-md-12");
        $("#bloqArchivo").addClass("col-md-6");
        $("#divObservacion").show();
        $("#fecha_asignacion").prop("required", false);
        // $("#divAsignacionFuncionarios").hide();
      }
      else if(option === "PENDIENTE"){
        $("#bloqArchivo").addClass("d-none");
    	  $("#fecha_inicio_suspencion").prop("required", false);
     	  $("#fecha_final_suspencion").prop("required", false);
    	  $("#content-date").addClass("d-none");
     	  $("#content-fecha").addClass("d-none");
        $("#divObservacion").hide();
        $("#bloqArchivo").removeClass("col-md-6");
        $("#bloqArchivo").addClass("col-md-12");
        $("#fecha_asignacion").prop("required", false);
        // $("#divAsignacionFuncionarios").hide();
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
        "¿Está seguro que desea eliminar esta actividad?"
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
      $("input").prop("disabled", false);
      $("select").prop("disabled", false);
      $("textarea").prop("disabled", false);
      $("button[name=eliminarFuncionario]").prop("disabled", false);
      $("#btnGuardar").prop("disabled", false);
      $("#btnBuscarFuncionarios").prop("disabled", false);
      $("#identificacion").prop("disabled", true);

      $("#btnEditar").prop("disabled", true);
      $("#btnPdf").prop("disabled", true);
      $("#btnExcel").prop("disabled", true);
      $("#btnEliminarActividad").prop("disabled", true);

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
          <td>${documento}</td>
          <td>${nombre}</td>
          <td>${apellidos}</td>
          <td>${tipo_vinculacion}</td>
          <td>${nivel}</td>
          <td>${cargo}</td>
          <td>${sede}</td>
          <td style="text-align:center">
          <button class="btn btn-danger btn-sm" name="eliminarFuncionario"><i class="fa fa-trash-o"></i></button>
          </td>
          </tr>`;
        $("#tblAsignarFuncionarios tbody").append(tr);
      });
    });
    
    // $(document).on(
    //   "keypress",
    //   "#tbl_funcionarios thead input[type=text]",
    //   function (e) {
    //     var keycode = e.keyCode ? e.keyCode : e.which;
    //     if (keycode == "13") {
    //       getFuncionarioAllFilter();
    //     }
    //   }
    // );
    
  });
  
  //Majjul
  document.addEventListener("keyup", e => {
    if(e.target.matches("#searchByIdentification")){
      hiddenShowDataFilter(e);
    }
    if(e.target.matches("#searchByCode")){
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
  
  let checkLastState;
  function guardarAsignacion() {

    let funcionariosAsignados = [];
    
    $("#tblAsignarFuncionarios tbody tr").each(function () {
      fila = {
        id_funcionario: $(this).find("input[name=id_funcionario]").val() == "" ? "" : $(this).find("input[name=id_funcionario]").val(),
        fecha_asignacion: $("#fecha_asignacion").val()
      };
      funcionariosAsignados.push(fila);
    });
    
    data = {
      id_actividad: $("#id_actividad").val(),
      nombre: $("#nombre").val(),
      identificacion: $("#identificacion").val(),
      fecha_inicio: $("#fecha_inicio").val(),
      fecha_finalizacion: $("#fecha_finalizacion").val(),
      modalidad: $("#modalidad").val(),
      direccion: $("#direccion").val(),
      ciclo: $("#ciclo").val(),
      recursos: $("#recursos").val(),
      valorTotal: $("#valorTotal").val(),
      entidad: $("#entidad").val(),
      observacion: $("#observacion").val(),
      estado: $("#estado").val(),
      funcionariosAsignados: funcionariosAsignados,

	    //Majjul
	    fecha_inicio_suspencion: $("#fecha_inicio_suspencion").val(),
      fecha_final_suspencion: $("#fecha_final_suspencion").val(),
      fecha_: $("#fecha_").val(),

    };

    $.post("set/actividadesProgramadas/modificar", {
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
  
  function getActividadAsignacion() {
    var trFuncionarios;
    let params = new URLSearchParams(location.search);
    var id_actividad = params.get("id_actividad");
    
    $.post( "ajaxGeneral.php?mode=getActividadesProgramadasAsignacion", { id_actividad: id_actividad })
        .done(function( data ) {
        
            if (data.trim() !== "") {
            
                data = JSON.parse(data);
                
                if (data.error != undefined) {
                    alertError(data.error);
                    return;
                }
                
                $(data).each(function () {
                    checkLastState = this.estado;
                    $("#identificacionTrazabilidad").val(this.identificacion).prop("disabled", true);
                    $("#nombreTrazabilidad").val(this.nombre).prop("disabled", true);
                    $("#id_actividad").val(this.id_actividadprogramada);
                    $("#identificacion").val(this.identificacion).prop("disabled", true);
                    $("#nombre").val(this.nombre).prop("disabled", true);
                    $("#ciclo option[value="+this.ciclo+"]").prop("selected", true);
                    $("#ciclo").prop("disabled", true);
                    $("#recursos option[value="+this.recursos+"]").prop("selected", true)
                    $("#recursos").prop("disabled", true)
                    $("#valorTotal").val(this.valor_total).prop("disabled", true)
                    $("#fecha_inicio").val(this.fecha_ini).prop("disabled", true);
                    $("#fecha_finalizacion").val(this.fecha_fin).prop("disabled", true);
                    $("#modalidad").val(this.is_presencial).prop("disabled", true);
                    $("#direccion").val(this.direccion).prop("disabled", true);
                    $("#entidad").val(this.entidad_actividad).prop("disabled", true);
                    $("#estado").val(this.estado);
                    $("#archivo").val(this.archivo);

                    $("#observacion").val(this.observacion).prop("disabled", true);;
                    $("#fecha_inicio_suspencion").val(this.fecha_inicio_suspencion).prop("disabled", true);
                    $("#fecha_final_suspencion").val(this.fecha_final_suspencion).prop("disabled", true);
                    $("#fecha_").val(this.fecha_).prop("disabled", true);

                    $("#recursos").trigger("change");
                    $("#estado").trigger("change");

                    //Majjul
                    if($("#estado").val() == "REALIZADO"){
                      if(this.funcionarios.length > 0){
                        $("#bloqArchivo").removeClass("d-none");
                        // $("#divAsignacionFuncionarios").show();
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
                      $("#tblAsignarFuncionarios tbody").html(trFuncionarios);
                    }
                });
                
                //$("#recursos").trigger("change");
                
                
            }
            
        });
    
    
    
  }
  
  function eliminarActividad() {
    data = {
      id_actividad: $("#id_actividad").val(),
    };
    $.post("set/actividadesProgramadas/eliminar", {
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
            <td name="nombres">${this.nombre}</td>
            <td name="apellidos">${this.apellidos}</td>
            <td name="codigo">${this.codigo}</td>
            <td name="cargo">${this.cargo}</td>
            <td name="sede">${this.sede}</td>
            </tr>`;
          });
          $("#tbl_funcionarios tbody").html(tr);
          getActividadAsignacion();
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
                  <input type="hidden" id="nombres" value='"${this.nombre}"'>
                  <input type="hidden" id="apellidos" value='"${this.apellidos}"'>
                  <input type="hidden" id="direccion" value='"${this.direccion}"'>
                  <input type="hidden" id="email" value='"${this.email}"'>
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

  function guardarTrazabilidad() {
    let estado = $("#estado").val();
    let fecha_ = $("#fecha_").val()
    let fecha_inicio_s = $("#fecha_final_suspencion").val()
    let fecha_final_s = $("#fecha_final_suspencion").val()

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
      id_actividadprogramada: $("#id_actividad").val(),
      estado: $("#estado").val(),
      observacion: $("#observacion").val(),
      fecha_inicio_suspencion: fecha_inicio_s,
      fecha_final_suspencion: fecha_final_s,
      fecha_: fecha_,
    };
    $.post("set/actividadesProgramadas/trazabilidad", {
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
    var id_actividad = params.get("id_actividad");
    var trTrazabilidad;
    $.post( "ajaxGeneral.php?mode=getActividadesProgramadasTrazabilidad", { 
      id_actividad: id_actividad
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
                <td name="tiempo_gen">${ this.tiempo_gen == null || "" ? "" : this.tiempo_gen}</td>
                <td name="estado">${ this.estado == null || "" ? "" : this.estado}</td>
                <td name="observacion">${ this.observacion == null || "" ? "Sin observaciones" : this.observacion }</td>
                <td name="fecha_inicio_suspencion">${ this.fecha_inicio_suspencion == null || "" ? "No aplica" : this.fecha_inicio_suspencion}</td>
                <td name="fecha_final_suspencion">${ this.fecha_final_suspencion == null || "" ? "No aplica" : this.fecha_final_suspencion}</td>
                <!-- <td name="fecha_">${ this.fecha_ == null || "" ? "Pendiente" : this.fecha_}</td> -->
                </tr>`;              
              });
            }
            $("#trazabilidadActividadesProgramadas tbody").html(trTrazabilidad);
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
  //