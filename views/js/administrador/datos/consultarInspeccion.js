$(document).ready(function () {
    let params = new URLSearchParams(location.search);
    cargarSede();
    var id_inspeccion = params.get("id_inspeccion");
    if(id_inspeccion)
      getInspeccionUnica(id_inspeccion)
    $("#filterTable").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      $("#tblActividad tbody tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      });
    });
    $("#filterTable").on("keypress", function (e) {
      var identificacion = $(this).val();
      var keycode = e.keyCode ? e.keyCode : e.which;
      if (keycode == "13") {
        getInspeccion(identificacion);
      }
    });
    $(document).on("click", "#btnGuardar", function () {
      var frm = $(this).parents("form:first").addClass("was-validated");
      invalid = $(frm).find(".form-control:invalid").length;
      // Se continua al siguiente paso si el formulario no tiene datos invalidos
      if (invalid == 0) {
        $(this).html("Creando...").prop("disabled", true);
        guardarInspeccion();
      }
    });
    $("#btnNuevo").click(function () {
      location.href = "?view=inspeccion&mode=crear";
    });

    $(document).on("change", "#tipo_inspeccion", () => {
      if($("#tipo_inspeccion").val() == 12){
        $("#divDescripcion").show();
        $("#descripcion").prop('required', true);
      }else{
        $("#divDescripcion").hide();
        $("#descripcion").prop('required', false);
      }
    });

    $("#btnEliminarActividad").prop("disabled", true);

    //Majjul 
    $("#btnExcel").click(function () {
      loadReporteEcxel();
    });

    //Majjul
    $(document).on("click", "#btnPdf", () => {
      loadReportePDF();
    });

    // Majjul
    $("#btnReporte").click(function () {
      getReporteInspeccionesProgramadas();
    });
    $("#btnBuscarAll").click(function () {
      $(this).html(`<i class="fa fa-eye"></i> BUSCANDO...`);
      getInspeccion();
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
         $(".show-info-traz").removeClass("d-none");
         $("#btnEliminarActividad").hide();
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

    // Majjul
    // $(document).on("change", "#estado", function () {
    //   if ($(this).val() == "REALIZADO") {
    //     $("#divMotivo").hide();
    //     $("#divObservacion").show();
    //     // $("#fecha_asignacion").attr("required", "");
    //     // $("#divAsignacionFuncionarios").show();
    //   } else {
    //     $("#divMotivo").show();
    //     $("#divObservacion").hide();
    //   }
    // });
    $(document).on("click", "#btnEditar", function () {
      $("input").prop("disabled", false);
      $("select").prop("disabled", false);
      $("textarea").prop("disabled", false);
      $("button[name=eliminarFuncionario]").prop("disabled", false);
      $("#btnGuardar").prop("disabled", false);
      $("#btnBuscarFuncionarios").prop("disabled", false);
      $("#identificacion").prop("disabled", true);
    });
    $("#mes").change(function () {
      getInspeccion(null, $(this).val());
    });
  });
  //majjul
    $(document).on("change", "#estado", function (){
      let option = $(this).val();
      if(option == "REALIZADO"){
        $("#bloqArchivo").removeClass("d-none");
        $(".content-date").addClass("d-none")
        $("#fecha_inicio_suspencion").prop("required", false);
        $("#fecha_final_suspencion").prop("required", false);
        // $("#content-fecha").removeClass("d-none");
	      $("#divObservacion").show();
	      $("#divMotivo").hide();
        $("#content-estado").removeClass("col-md-6")
        $("#content-estado").addClass("col-md-12")
      }else if(option == "SUSPENDIDO"){
        // $("#content-fecha").addClass("d-none");
        $(".content-date").removeClass("d-none");
        $("#fecha_inicio_suspencion").prop("required", true);
        $("#fecha_final_suspencion").prop("required", true);
	      $("#divObservacion").hide();
	      $("#divMotivo").show();
        $("#bloqArchivo").addClass("d-none");
        $("#content-estado").removeClass("col-md-12")
        $("#content-estado").addClass("col-md-6")
      }else if(option == "CANCELADO"){
        $("#bloqArchivo").addClass("d-none");
        $("#fecha_inicio_suspencion").prop("required", false);
        $("#fecha_final_suspencion").prop("required", false);
        // $("#content-fecha").removeClass("d-none");
        $(".content-date").addClass("d-none");
	      $("#divObservacion").hide();
	      $("#divMotivo").show();
        $("#content-estado").removeClass("col-md-6")
        $("#content-estado").addClass("col-md-12")
      }else if(option == ""){
        $("#bloqArchivo").addClass("d-none");
	      $("#fecha_inicio_suspencion").prop("required", false);
 	      $("#fecha_final_suspencion").prop("required", false);
	      $(".content-date").addClass("d-none");
 	      // $("#content-fecha").addClass("d-none");
	      $("#divMotivo").hide();
        $("#divObservacion").hide();
        $("#content-estado").removeClass("col-md-6")
        $("#content-estado").addClass("col-md-12")
	    }
    });

//Majjul
$(document).on("change", "#reporteEstado", function (){
   let estado = $("#reporteEstado").val();
   getReporteInspeccionesProgramadas(estado);
});

function getReporteInspeccionesProgramadas(estado = null) {
    $.post("ajaxGeneral.php?mode=getReporteInspeccionesProgramadas", {
    	   estado: estado
     })
     .done(function (data) {
   	  $("#tblInspeccionesReportes").removeClass('d-none');
        $("#tblActividad").addClass('d-none');
        if (data.trim() !== "") { 
            data = JSON.parse(data);
            if (data.error != undefined) {
                alertError(data.error);
                return;
            }
	      var tr = "";
		console.log(data);
		$(data).each(function () {
             tr += `<tr>
			          <td name="identificacion">${this.identificacion}</td>
              	<td name="is_presencial">${this.modalidad}</td>
              	<td name="dependencia">${this.dependencia}</td>
			          <td name="estado">${ this.estado == undefined ? "PENDIENTE" : this.estado }</td>
			          <td name="opcion">
			            <a href="?view=inspeccion&mode=consultarInspeccion&id_inspeccion=${ this.id_inspeccion }">
			          	<i class="fa fa-eye">
			            </a>
			          </td>
                </tr>`
		});
        $("#tblInspeccionesReportes tbody").html(tr);
        }
    });
}

  function getInspeccion(identificacion = null, mes = null) {
    $.post("ajaxGeneral.php?mode=getInspeccion", {
      identificacion: identificacion,
      mes:mes
    })
      .done(function (data) {
 	  // Majjul
	  $("#tblActividad").removeClass('d-none');
	  $("#tblInspeccionesReportes").addClass('d-none');
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
              <input type="hidden" name="id_inspeccion" value='"${
                this.id_inspeccion
              }"'>
              <td name="identificacion">${this.identificacion}</td>
              <td name="fecha_ini">${this.fecha_ini}</td>
              <td name="fecha_fin">${this.fecha_fin}</td>
              <td name="is_presencial">${this.modalidad}</td>
              <td name="dependencia">${this.dependencia}</td>
              <td name="estado">${
                this.estado == undefined || this.estado.length < 2 ? "PENDIENTE" : this.estado
              }</td>
              <td><a href="?view=inspeccion&mode=consultarInspeccion&id_inspeccion=${
                this.id_inspeccion
              }"><i class="fa fa-eye"></a></td>
              </tr>`;
          });
          $("#tblActividad tbody").html(tr);
          if (data.length > 0) $("#filterTable").show();
        }
      })
      .always(function () {
        $("#btnBuscarAll").html(`<i class="fa fa-eye"></i> BUSCAR TODO`);
      });
  }
  

  function CargarDependencia(id_dependencia = null) {
    $.post("ajaxGeneral.php?mode=dependencia").done(function (data) {
      if (data.trim() !== "") {
        data = JSON.parse(data);
        // console.log(data);
        let dependencia = '<option value="" selected>Seleccione...</option>';
        if (data.error != undefined) {
          alertError(data.error);
          return;
        } else {
          $.each(data, function () {
            dependencia += `<option value="${this.id_dependencia}">${this.dependencia}</option>`;
          });
        }
        $("#dependencia").html(dependencia);
        if(id_dependencia != null)
          $("#dependencia").val(id_dependencia).prop("disabled",true);
      }
    });
  }
  let checkLastState;

  function guardarInspeccion() {
    // let funcionariosAsignados = [];
    // $("#tblFuncionariosAsignados tbody tr").each(function () {
    //   fila = {
    //     id_funcionario:
    //       $(this).find("input[name=id_funcionario]").val() == ""
    //         ? ""
    //         : $(this).find("input[name=id_funcionario]").val(),
    //   };
    //   funcionariosAsignados.push(fila);
    // });
    data = {
      id_inspeccion: $("#id_inspeccion").val(),
      identificacion: $("#identificacion").val(),
      tipo_inspeccion: $("#tipo_inspeccion").val(),
      fecha_inicio: $("#fecha_inicio").val(),
      fecha_finalizacion: $("#fecha_finalizacion").val(),
      modalidad: $("#modalidad").val(),
      dependencia: $("#dependencia").val(),
      entidad: $("#entidad").val(),
      estado: $("#estado").val(),
      motivo: $("#motivo").val(),
      observacion: $("#observacion").val(),
      archivo: $("#archivo").val(),
      descripcion: $("#descripcion").val(),
      sede: $("#AllSede").val(),
	//Majjul
	    fecha_inicio_suspencion: $("#fecha_inicio_suspencion").val(),
      fecha_final_suspencion: $("#fecha_final_suspencion").val(),
      fecha_: $("#fecha_").val(),
    };
    $.post("set/inspeccion/modificar", {
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

  
function cargarSede() {
  $.post("ajaxGeneral.php?mode=sede").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let sede = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          sede += `<option value="${this.id_sede}">${this.sede}</option>`;
        });
      }
      $("#AllSede").html(sede);
    }
  });
}

  function getInspeccionUnica(id_inspeccion) {
    $.post("ajaxGeneral.php?mode=getInspeccionUnique", {
      id_inspeccion: id_inspeccion,
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
            console.log(data);
            checkLastState = this.estado;
            $("#tipoInspTrazabilidad").val(this.tipo_inspeccion).prop("disabled", true);
            $("#identificacionTrazabilidad").val(this.identificacion).prop("disabled", true);
            $("#id_inspeccion").val(this.id_inspeccion);
            $("#identificacion").val(this.identificacion).prop("disabled", true);
            $("#tipo_inspeccion").val(this.tipo_inspeccion).prop("disabled", true);
            $("#fecha_inicio").val(this.fecha_ini).prop("disabled", true);
            $("#fecha_finalizacion").val(this.fecha_fin).prop("disabled", true);
            $("#modalidad").val(this.is_presencial).prop("disabled", true);
            $("#direccion").val(this.direccion).prop("disabled", true);
            $("#modalidad").val(this.modalidad).prop("disabled", true);
            $("#entidad").val(this.responsable).prop("disabled", true);
            $("#estado").val(this.estado);
            $("#observacion").val(this.observacion);
            $("#descripcion").val(this.descripcion).prop("disabled", true);
            $("#AllSede").val(this.sede).prop("disabled", true);
            CargarDependencia(this.id_dependencia)

            if($("#tipo_inspeccion").val() == 12){
              $("#divDescripcion").show();
            }

		  // Majjul
	    if($("#estado").val() == "SUSPENDIDO"){
          $("#content-estado").removeClass("col-md-12")
          $("#content-estado").addClass("col-md-6")
		      $("#divMotivo").show();
         	$(".content-date").removeClass("d-none");
	        $("#motivo").val(this.motivo).prop("disabled", true);
        	$("#fecha_inicio_suspencion").val(this.fecha_inicio_suspencion).prop("disabled", true);
        	$("#fecha_final_suspencion").val(this.fecha_final_suspencion).prop("disabled", true);
	    }
	    else if($("#estado").val() == "REALIZADO"){
          $("#bloqArchivo").removeClass("d-none");
        	// $("#content-fecha").removeClass("d-none");
		      $("#fecha_").val(this.fecha_).prop("disabled", true);
		      $("#divObservacion").show();
	    }
	    else if($("#estado").val() == "CANCELADO"){
       	// $("#content-fecha").removeClass("d-none");
		    $("#fecha_").val(this.fecha_).prop("disabled", true);
		    $("#divMotivo").show();
		    $("#motivo").val(this.motivo).prop("disabled", true);
	    }
            $("#archivo").prop("disabled",true);
            if ($("#estado").val() == "REALIZADO")
            //  $("#btnEditar").prop("disabled", true);
             $("#divObservacion").show();
            // this.recursos == "FINANCIERO" || this.recursos == "AMBOS"
            //  $("#divValorTotal").show();
            // $("#motivo").val(this.motivo);
          });
        }
      })
      .always(function () {
        $("#btnBuscarAll").html(`<i class="fa fa-eye"></i> BUSCAR TODO`);
      });
  }

  // Majjul
  function loadReportePDF() {

    ancho = 815;
    alto = 460;
    barra = 0;
    izquierda = (screen.width) ? (screen.width-ancho)/2 : 100;
    arriba = (screen.height) ? (screen.height-alto)/2 : 100;
    opciones = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars='+barra+',resizable=0,width='+ancho+',height='+alto+',left='+izquierda+',top='+ arriba;
    newwindow = window.open("?view=reportes&mode=consultarinspeccionespdf", 'popUp', opciones)
    if (newwindow == null) {
      alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
    } else {
      newwindow.creator = self
    }
  }

    // Majjul
    function loadReporteEcxel() {
      newwindow = window.open("?view=reportes&mode=consultainspeccionexcel", "width=815,height=460")
      if (newwindow == null) {
        alert('Configure el navegador para que permita las ventanas emergentes en esta pagina');
      } else {
        newwindow.creator = self
      }
  }

  
  function guardarTrazabilidad() {
    let estado = $("#estado").val();
    let fecha_ = $("#fecha_").val()
    let fecha_inicio_s = $("#fecha_final_suspencion").val()
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
      id_inspeccion: $("#id_inspeccion").val(),
      estado: $("#estado").val(),
      observacion: observacion,
      fecha_inicio_suspencion: fecha_inicio_s,
      fecha_final_suspencion: fecha_final_s,
      fecha_: fecha_,
    };
    $.post("set/inspeccion/trazabilidad", {
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
    var id_inspeccion = params.get("id_inspeccion");
    var trTrazabilidad;
    $.post( "ajaxGeneral.php?mode=getInspeccionesTrazabilidad", { 
      id_inspeccion: id_inspeccion
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
                <td name="tiempo_gen">${ this.tiempo_gen == null || "" ? "" : this.tiempo_gen }</td>
                <td name="estado">${ this.estado == null || "" ? "" : this.estado}</td>
                <td name="observacion">${ this.observacion == null || " " ? "Sin observaciones" : this.observacion }</td>
                <td name="fecha_inicio_suspencion">${ this.fecha_inicio_suspencion == null || "" ? "No aplica" : this.fecha_inicio_suspencion }</td>
                <td name="fecha_final_suspencion">${ this.fecha_final_suspencion == null || "" ? "No aplica" : this.fecha_final_suspencion }</td>
                <!-- <td name="fecha_">${ this.fecha_ == null || "" ? "No aplica" : this.fecha_ }</td> -->
                </tr>`;              
              });
            }
            $("#trazabilidadInspecciones tbody").html(trTrazabilidad);
        }
        
    });
  }//