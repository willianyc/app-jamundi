let params = new URLSearchParams(location.search);
id_matrizGet = params.get("id_matriz");

$(document).ready(function () {
    cargo()
    cargarSede()
    CargarDependencia() //majjul
    
    //console.log(id_matrizGet);
    
    if(id_matrizGet != null) getMatriz(id_matrizGet)
    
    $(document).on("click", "#btnGuardar", function () {
    
      let invalid = 0;
      
      if($("input[name=is_entidad]").val() == 1){
        $('#lugar').removeAttr("required");
      }else{
        $("#AllSede").removeAttr("required");
        $("#dependencia").removeAttr("required");
        $("#cargoPropiedad").removeAttr("required");
      }

      var frm = $(this).parents("form:first").addClass("was-validated");

      invalid = $(frm).find(".form-control:invalid").length;

      // alert(invalid);

      // Se continua al siguiente paso si el formulario no tiene datos invalidos

      if (invalid == 0) {

        $(this).html("Creando...").prop("disabled", true);

        guardarMatriz();

      }

    });

    $(document).on("change", "#estado", () => {
      if($("#estado").val() == "CERRADO"){
        $("#avance").prop("disabled", true).val(0);
      }else{
        $("#avance").prop("disabled", false);
      }
    });

     // Majjul
     let showTrazabilidad = true;
     $(document).on("click", "#btnTrazabilidad", () => {
       if(showTrazabilidad){
         $(".hidden-info").addClass("d-none");
         $(".trazabilidad").removeClass("d-none");
         $("#trzText").text("OCULTAR SEGUIMIENTO");
         $("#btnEditar").hide();
         $("#btnPdf").hide();
         $("#btnExcel").hide();
         $("#btnEliminarMatriz").hide();
         showTrazabilidad = false;
       }else{
         $(".hidden-info").removeClass("d-none");
         $(".trazabilidad").addClass("d-none");
         $("#trzText").text("VER SEGUIMIENTO");
         $("#btnEditar").show();
         $("#btnPdf").show();
         $("#btnExcel").show();
         $("#btnEliminarMatriz").show();
 
         showTrazabilidad = true;
       }
       getTrazabilidad();
     });
    
    changeTextBtn = false;
    $(document).on("click", "#newTrazabilidad", () => {
      $(".seccionesSeguimiento:last input").prop("disabled", false).val("");
      $(".seccionesSeguimiento:last select").prop("disabled", false).val("");
      $(".seccionesSeguimiento:last textarea").prop("disabled", false).val("");
      $("#btnGuardar").hide();
      $("#btnGuardarTrazabilidad").prop("disabled", false).show();
      $(".secciones:last input").prop("disabled", true);
      $(".secciones:last select").prop("disabled", true);
      $(".secciones:last textarea").prop("disabled", true);
      $("#btnEditar").prop("disabled", false);
      if(changeTextBtn == false){
        $("#newTrazabilidad").text("- DESHACER");
        changeTextBtn = true;
      }else{        
        $("#newTrazabilidad").text("+ NUEVO SEGUIMIENTO");
        $("#btnGuardarTrazabilidad").hide();
        getMatriz(id_matrizGet)
        $("btnGuardar").show();
        changeTextBtn = false;
      }
    });
    $(document).on('click', '#btnGuardarTrazabilidad', () => {
      $("#btnEditar").trigger("click");
      $(".seccionesSeguimiento:last input").prop("disabled", false);
      $(".seccionesSeguimiento:last select").prop("disabled", false);
      $(".seccionesSeguimiento:last textarea").prop("disabled", false);
      $("#btnGuardar").trigger("click");
       guardarTrazabilidad();
    });
    
    $(document).on("click", "#btnEditar", function () {
      $(".seccionesSeguimiento:last input").prop("disabled", true);
      $(".seccionesSeguimiento:last select").prop("disabled", true);
      $(".seccionesSeguimiento:last textarea").prop("disabled", true);
      $(".secciones:last input").prop("disabled", false);
      $(".secciones:last select").prop("disabled", false);
      $(".secciones:last textarea").prop("disabled", false);
      $("#btnGuardar").prop("disabled", false).show();
      $("#btnGuardarTrazabilidad").hide();
      
      $("#btnEditar").prop("disabled", true);
      $("#btnEliminarMatriz").prop("disabled", true);
      $("#btnPdf").prop("disabled", true);
      $("#btnExcel").prop("disabled", true);
      
      console.log($("input[name=is_entidad]").val());
      
      if($("input[name=is_entidad]").val() === "1"){
          //$(".contentLugar").hide()
          //$(".contentSedeDenominacion").show();
          //$('#lugar').removeAttr("required");
          //$('#AllSede').prop("required", true);
          //$('#dependencia').prop("required", true);
          //$('#cargoPropiedad').prop("required", true);
      }
      else{
          //$(".contentLugar").show()
          //$(".contentSedeDenominacion").hide();
          //$('#AllSede').removeAttr("required");
          //$('#dependencia').removeAttr("required");
          //$('#cargoPropiedad').removeAttr("required");
          //$('#lugar').prop("required", true);
      }
      
      if($("#estado").val() == "CERRADO"){
         
          $(".contentFechaCierre").show();
          $('#fechaCierre').prop("required", true);
      }
      else{
          $(".contentFechaCierre").hide()
          $('#fechaCierre').removeAttr("required");
      }
      
    });

    $(document).on("click", "#btnEliminarMatriz", function () {
        var deleteMatriz = confirm("�Desea eliminar esta matriz?");
        if (deleteMatriz) eliminarMatriz();
    });
   
    $(document).on("change", "input[name=is_entidad]", function () {
        if($(this).val() == "1"){
          $(".contentLugar").hide()
          $(".contentSedeDenominacion").show();
          $('#lugar').removeAttr("required");
          $('#AllSede').prop("required", true);
          $('#dependencia').prop("required", true);
          $('#cargoPropiedad').prop("required", true);
        }else{
          $(".contentLugar").show()
          $(".contentSedeDenominacion").hide();
          $('#AllSede').removeAttr("required");
          $('#dependencia').removeAttr("required");
          $('#cargoPropiedad').removeAttr("required");
          $('#lugar').prop("required", true);
        }
    });
    
    $(document).on("change", "#estado", function () {
        $("#fechaCierre").val('')
        if($(this).val() == "CERRADO"){
          $(".contentFechaCierre").show();
          $("#bloqArchivo").removeClass("d-none");
          $('#fechaCierre').prop("required", true);
        }else{
          $("#bloqArchivo").addClass("d-none");
          $(".contentFechaCierre").hide()
          $('#fechaCierre').removeAttr("required");
        }
    });
    
    
});

function cargo() {
  $.post("ajaxGeneral.php?mode=cargo").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let cargo = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          cargo += `<option value="${this.id_cargo}">${this.cargo}</option>`;
        });
      }
      $("#cargoPropiedad").html(cargo);
    }
  });
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


//majjul
function CargarDependencia() {
  $.post("ajaxGeneral.php?mode=dependencia").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      //console.log(data);
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
    }
  });
}

let checkLastState;
function guardarMatriz() {

  fechaPropuestaCierre = $("#fechaPropuestaCierre").val();
  if(fechaPropuestaCierre == ""){
    fechaPropuestaCierre = null
  }
  fechaSeguimiento = $("#fechaSeguimiento").val();
  if(fechaSeguimiento == ""){
    fechaSeguimiento = null
  }
 let url = "";
    
 data = {
    id_matriz: $("#id_matriz").val(),
    is_entidad: $("input[name=is_entidad]:checked").val(),
    fecha: $("#fecha").val(),
    origenHallazgo: $("#origenHallazgo").val(),
    descripcionHallazgo: $("#descripcionHallazgo").val(),
    elementoSiguiente: $("#elementoSiguiente").val(),
    recomendacion: $("#recomendacion").val(),
    tipoAccion: $("#tipoAccion").val(),
    responsable: $("#responsable").val(),
    fechaPropuestaCierre: fechaPropuestaCierre,
    accionTomada: $("#accionTomada").val(),
    estado: $("#estado").val(),
    fechaSeguimiento: fechaSeguimiento,
    avance: $("#avance").val(),
    archivo: $("#archivo").val(),
 };
 
 console.log(data)

 if($("input[name=is_entidad]:checked").val() == 1){
    data.sede = $("#AllSede").val();
    data.dependencia = $("#dependencia").val();
    data.denominacion = $("#cargoPropiedad").val();
    data.lugar = '';
 }
 else{
    data.lugar = $("#lugar").val();
    data.sede = '';
    data.dependencia = '';
    data.denominacion = '';
 }
 
 
 if($("#estado").val() == "CERRADO"){
    data.fechaCierre = $("#fechaCierre").val();
 }
 else{
    let fecha = new Date();  
    document.getElementById("fechaCierre").value = fecha.toJSON().slice(0,10);
    data.fechaCierre = $("#fechaCierre").val();
 }
 
 
 if(id_matrizGet != null){
     url = "set/matrizCumplimiento/modificar"
     console.log("modificar")
 }
 else{
     url = "set/matrizCumplimiento/crear"
     console.log("crear")
 }
 
 console.log(url);
 
 $.post(url, {
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
            $(".secciones:last input").prop("disabled", true);
            $(".secciones:last select").prop("disabled", true);
            $(".secciones:last textarea").prop("disabled", true);
          }
        }
      }).always(function () {
        $("#btnGuardar")
          .html('<i class="fa fa-save"></i> GUARDAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
          $("#btnGuardar").hide();
      });
      
    //console.log(Object.keys(data));
    //console.log(Object.values(data));
    
}

function getMatriz(id_matriz = null) {
    //alert(1);
    $.post("ajaxGeneral.php?mode=getMatriz", {
      id_matriz: id_matriz,
    })
      .done(function (data) {
        if (data.trim() !== "") {
          data = JSON.parse(data);
          if (data.error != undefined) {
            alertError(data.error);
            return;
          }
          $(data).each(function () {
            checkLastState = this.estado;
            $("#id_matriz").val(this.id_matriz)
            $("input[name=is_entidad][value="+this.is_entidad+"]").prop("checked", true);
            $("input[name=is_entidad]").prop("disabled", true);
            $("input[name=is_entidad]").trigger("change");
            $("#fecha").val(this.fecha).prop("disabled", true);
            $("#lugar").val(this.lugar).prop("disabled", true);
            $("#AllSede").val(this.sede).prop("disabled", true);
            $("#dependencia").val(this.dependencia).prop("disabled", true);
            $("#cargoPropiedad").val(this.denominacion).prop("disabled", true);
            $("#origenHallazgo").val(this.origen_hallazgo).prop("disabled", true);
            $("#descripcionHallazgo").val(this.descripcion_hallazgo).prop("disabled", true);
            $("#elementoSiguiente").val(this.elemento_interviene).prop("disabled", true);
            $("#recomendacion").val(this.recomendacion).prop("disabled", true);
            $("#tipoAccion").val(this.tipo_accion).prop("disabled", true);
            $("#responsable").val(this.responsable).prop("disabled", true);
            $("#fechaPropuestaCierre").val(this.fechapropuesta_cierre).prop("disabled", true);
            $("#fechaCierre").val(this.fecha_cierre).prop("disabled", true);
            $("#fechaCierre").val(this.fecha_cierre);
            $("#fechaSeguimiento").val(this.fecha_seguimiento).prop("disabled", true);
            $("#accionTomada").val(this.accion_tomada).prop("disabled", true);
            $("#avance").val(this.avance).prop("disabled", true);
            $("#estado").val(this.estado).prop("disabled", true);
            $("#archivo").val(this.archivo).prop("disabled", true);
            $("#btnGuardar").prop("disabled", true);
            $("#btnGuardarTrazabilidad").prop("disabled", true);
            $("#btnBuscar").trigger("click");
            if(this.is_entidad == "1"){
              $(".contentLugar").hide()
              $(".contentSedeDenominacion").show()
            }else{
              $(".contentLugar").show()
              $(".contentSedeDenominacion").hide()
            }
            
            if(this.estado === "CERRADO"){
              $("#bloqArchivo").removeClass("d-none");
              $(".contentFechaCierre").show();
            }else{
               $(".contentFechaCierre").hide();
            }
          });
        }
      })
  }

  function guardarTrazabilidad() {
    let estado = $("#estado").val();

    let fecha_cierre;

    if(estado == "ABIERTO" || estado == "EN PROCESO"){
      fecha_cierre = "";
    }else{
      fecha_cierre = $("#fechaCierre").val();
    }
   
    data = {
      id_matriz: $("#id_matriz").val(),
      tipo_accion: $("#tipoAccion").val(),
      responsable: $("#responsable").val(),
      fechapropuesta_cierre: $("#fechaPropuestaCierre").val(),
      accion_tomada: $("#accionTomada").val(),
      estado: $("#estado").val(),
      fecha_cierre: fecha_cierre,
      fecha_seguimiento: $("#fechaSeguimiento").val(),
      avance: $("#avance").val(),
      // documento_soporte: $("#archivo").val()
    };
    $.post("set/matrizCumplimiento/trazabilidad", {
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

  function eliminarMatriz() {
    data = {
      id_matriz: $("#id_matriz").val(),
    };
    $.post("set/matrizCumplimiento/eliminar", {
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
            $("#btnEliminarMatriz").prop("disabled", true);
            $("#btnEditar").prop("disabled", true);
            $("#btnPdf").prop("disabled", true);
            $("#btnExcel").prop("disabled", true);
            $("#btnGuardar").hide();
      
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
    function getTrazabilidad() {
      let params = new URLSearchParams(location.search);
      var id_matriz = params.get("id_matriz");
      var trTrazabilidad;
      $.post( "ajaxGeneral.php?mode=getMatrizTrazabilidad", { 
        id_matriz: id_matriz
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
                  <td name="tiempo_gen">${ this.tiempo_gen == null || "" ? "" :this.tiempo_gen }</td>
                  <td name="estado">${ this.estado == null || "" ? "" :this.estado }</td>
                  <td name="tipo_accion">${ this.tipo_accion == null || "" ? "No aplica" :this.tipo_accion }</td>
                  <td name="responsable">${ this.responsable == null || "" ? "No registrado" :this.responsable }</td>
                  <td name="fechapropuesta_cierre">${ this.fechapropuesta_cierre == null || "" ? "No aplica" :this.fechapropuesta_cierre }</td>
                  <td name="accion_tomada">${ this.accion_tomada == null || "" ? "Sin acción registrada" :this.accion_tomada }</td>
                  <td name="fecha_cierre">${ this.fecha_cierre == null || "" ? "Pendiente" :this.fecha_cierre}</td>
                  <td name="fecha_seguimiento">${ this.fecha_seguimiento == null || "" ? "No aplica" :this.fecha_seguimiento }</td>
                  <td name="avance">${ this.avance == null || "" ? "0" :this.avance }%</td>
                  </tr>`;              
                });
              }
              $("#trazabilidadMatriz tbody").html(trTrazabilidad);
          }
          
      });
    }
  