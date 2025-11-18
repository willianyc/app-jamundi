var parentesco = "",
  cont = 1,
  meses = 0,
  meses_2 = 0,
  dias = 0,
  dias_2 = 0,
  anos = 0,
  anos_2 = 0;
var reader = new FileReader();

var id_funcionario_exist = false;
$(document).ready(function () {

  $("#btnMakeSaldoinicla").click(function () {
    var frm = $(this).parents("form:first").addClass("was-validated");
    invalid = $(frm).find(".form-control:invalid").length;
    // Se continua al siguiente paso si el formulario no tiene datos invalidos
    if (invalid == 0) {
      GuardarFuncionario();
      console.log($('#cedula').val())        
    }
  });

    estado_civil()
    cargarSede()
    CargarDependencia()
    CargarNivel()
    //nivelEducativo()
    vinculacion()
    rh()
    CargarVictima();
    CargarEtnia()
    CargarMunicipio();
    Parentesco();


  $(document).on("click", "#delete_fun", function () {
    id_funcionario = $("#id_funcionario").val();
    deleteFuncionario(id_funcionario);
  });

  $("#btnMakeEditar").click(function () {
    $(".desactivar").removeAttr("disabled");
  });

  $("#btnIrAtras").click(function () {
    location.href = "?view=consultas&mode=consultarfuncionario";
  });



 
  $("input[name=procesos_disc]").click(function () {
    if ($(this).val() == 1) {
      $(this)
        .parents("div.inp_procesos")
        .find(".proceso_disciplinario")
        .removeClass("d-none");
      $("#numero_proceso").attr("required", "required");
      $("#fecha_proceso").attr("required", "required");
    } else {
      $(this)
        .parents("div.inp_procesos")
        .find(".proceso_disciplinario")
        .addClass("d-none");
      $("#numero_proceso").removeAttr("required");
      $("#fecha_proceso").removeAttr("required");
      $(this).parents("div.inp_procesos").find("#numero_proceso").val("");
      $(this).parents("div.inp_procesos").find("#fecha_proceso").val("");
    }
  });

  $(document).on("change", "select[name=parentesco]", function () {
    if ($(this).val() == 6) {
      $(this)
        .parents("tr")
        .find("input[name=parentesco_otro]")
        .removeAttr("disabled");
      $(this)
        .parents("tr")
        .find("input[name=parentesco_otro]")
        .removeAttr("required");
    } else {
      $(this).parents("tr").find("input[name=parentesco_otro]").val("");
      $(this)
        .parents("tr")
        .find("input[name=parentesco_otro]")
        .attr("disabled", "disabled");
      $(this)
        .parents("tr")
        .find("input[name=parentesco_otro]")
        .attr("required", "required");
    }
  });

  // $("#madre_padre").change(function () {
  //   if ($(this).val() == "NO") {
  //     $("#is_cabezafamilia").val(0);
  //     $("#is_cabezafamilia").attr("disabled", "disabled");
  //   } else {
  //     $("#is_cabezafamilia").removeAttr("disabled");
  //   }
  // });

  $("#info_funcionario input").change(function () {
    let acade = true;
    $("#info_funcionario input[required]").each(function () {
      if ($(this).val() == "") acade = false;
    });
    $("#info_funcionario select[required]").each(function () {
      if ($(this).val() == "") acade = false;
    });
    if (acade) {
      $("#info_academica").removeClass("d-none");
      $("#nu_fam").removeClass("d-none");
    }
  });
  $("#info_funcionario select").change(function () {
    let acade = true;
    $("#info_funcionario input[required]").each(function () {
      if ($(this).val() == "") acade = false;
    });
    $("#info_funcionario select[required]").each(function () {
      if ($(this).val() == "") acade = false;
    });
    if (acade) {
      $("#info_academica").removeClass("d-none");
      $("#nu_fam").removeClass("d-none");
    }
  });

  // $(document).on('change', '#exp_previa', function () {
  //   $('#exp_general').val(meses_2 + meses);
  // });

  // $(document).on('change', '#exp_institucional', function () {
  //   $('#exp_general').val(meses_2 + meses);
  // });

  $(document).on("change", "input[name=fecha_ingreso_exp]", function () {
    let fecha_retiro = $(this)
        .parents(".experiencia_anterior")
        .find(".fecha_retiro_exp")
        .val(),
      fecha_ingreso = $(this).val();
    if (fecha_ingreso > fecha_retiro && fecha_retiro != "") {
      $(this).val(fecha_retiro);
    } else if (new Date(fecha_ingreso) > new Date()) {
      var fecha = new Date();
      var mes = fecha.getMonth() + 1;
      var dia = fecha.getDate();
      var ano = fecha.getFullYear();
      fecha_act = ano + "-" + mes + "-" + dia;
      $(this).val(fecha_act);
    }
    //   if (fecha_ingreso != '' && fecha_retiro != '') {
    //     let fecha_ini = new Date(fecha_ingreso).getTime(),
    //       fecha_fin = new Date(fecha_retiro).getTime();
    //     dias_2 += ((fecha_fin - fecha_ini) / (1000 * 60 * 60 * 24))
    //     meses_2 = 0;
    //     anos_2 = 0;
    //     meses_val = Math.ceil(dias_2 / 30)
    //     anos_2 = Math.floor(meses_val / 12);
    //     meses_2 = Math.round(meses_val % 12);
    //     valor = `${anos_2} años, ${meses_2} meses`;
    //     $('#exp_previa').val(valor)
    //     meses_gen = meses_2 + meses;
    //     anos_gen = anos + anos_2;
    //     valor_gen = `${anos_gen} años, ${meses_gen} meses`;
    //     $('#exp_general').val(valor_gen);
    //   }
  });

  $(document).on("change", "input[name=fecha_retiro_exp]", function () {
    let fecha_ingreso = $(this)
        .parents(".experiencia_anterior")
        .find(".fecha_ingreso_exp")
        .val(),
      fecha_retiro = $(this).val();
    if (fecha_retiro < fecha_ingreso && fecha_ingreso != "") {
      $(this).val(fecha_ingreso);
    } else if (new Date(fecha_retiro) > new Date()) {
      var fecha = new Date();
      var mes = fecha.getMonth() + 1;
      var dia = fecha.getDate();
      var ano = fecha.getFullYear();
      fecha_act = ano + "-" + mes + "-" + dia;
      $(this).val(fecha_act);
    }
    //   if (fecha_ingreso != '' && fecha_retiro != '') {
    //     let fecha_ini = new Date(fecha_ingreso).getTime(),
    //       fecha_fin = new Date(fecha_retiro).getTime();
    //     dias_2 += ((fecha_fin - fecha_ini) / (1000 * 60 * 60 * 24))
    //     meses_2 = 0;
    //     anos_2 = 0;
    //     meses_val = Math.ceil(dias_2 / 30)
    //     anos_2 = Math.floor(meses_val / 12);
    //     meses_2 = Math.round(meses_val % 12);
    //     valor = `${anos_2} años, ${meses_2} meses`;
    //     $('#exp_previa').val(valor)
    //     meses_gen = meses_2 + meses;
    //     anos_gen = anos + anos_2;
    //     valor_gen = `${anos_gen} años, ${meses_gen} meses`;
    //     $('#exp_general').val(valor_gen);
    //   }
  });

  $("#info_academica input").change(function () {
    let acade = true;
    $("#info_academica input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#info_academica select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) $("#info_lab").removeClass("d-none");
  });
  $("#info_academica select").change(function () {
    let acade = true;
    $("#info_academica input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#info_academica select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) $("#info_lab").removeClass("d-none");
  });
  $("#info_lab input").change(function () {
    let acade = true;
    $("#info_lab input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#info_lab select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) $("#vivienda_car").removeClass("d-none");
  });
  $("#info_lab select").change(function () {
    let acade = true;
    $("#info_lab input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#info_lab select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) $("#vivienda_car").removeClass("d-none");
  });
  $("#vivienda_car input").change(function () {
    let acade = true;
    $("#vivienda_car input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#vivienda_car select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) $("#pros_disc").removeClass("d-none");
  });
  $("#vivienda_car select").change(function () {
    let acade = true;
    $("#vivienda_car input[required]").each(function () {
      type = $(this).attr("type");
      if ($(this).val() == "" && type != "radio") acade = false;
    });
    $("#vivienda_car select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) $("#pros_disc").removeClass("d-none");
  });
  $("#pros_disc input").change(function () {
    let acade = true;
    $("#pros_disc input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#pros_disc select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) {
      $("#paz_salvo_cont").removeClass("d-none");
      $("#btnMakeSaldoinicla").removeClass("d-none");
      $("#exp_laboral").removeClass("d-none");
    }
  });
  $("#pros_disc select").change(function () {
    let acade = true;
    $("#pros_disc input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#pros_disc select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) {
      $("#paz_salvo_cont").removeClass("d-none");
      $("#btnMakeSaldoinicla").removeClass("d-none");
      $("#exp_laboral").removeClass("d-none");
    }
  });
  $("#pros_disc input").change(function () {
    let acade = true;
    $("#pros_disc input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#pros_disc select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) $("#paz_salvo_cont").removeClass("d-none");
  });
  $("#pros_disc select").change(function () {
    let acade = true;
    $("#pros_disc input[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    $("#pros_disc select[required]").each(function () {
      if (
        $(this).val() == "" ||
        $(this).val() == null ||
        $(this).val() == undefined
      )
        acade = false;
    });
    if (acade) {
      $("#paz_salvo_cont").removeClass("d-none");
      $("#btnMakeSaldoinicla").removeClass("d-none");
      $("#btnMakeSaldoinicla").removeAttr("disabled");
    }
  });

  $(document).on("change", ".emergencia_check", function () {
    if ($(this).is(":checked")) {
      $(this)
        .parents("tr")
        .find("input.contacto_emergencia")
        .removeClass("d-none");
    } else {
      $(this).parents("tr").find("input.contacto_emergencia").val("");
      $(this)
        .parents("tr")
        .find("input.contacto_emergencia")
        .addClass("d-none");
    }
  });

  $("#cedula").keypress(function(e) {
    if(e.which == 13) {
      if(!id_funcionario_exist){
        //getFuncionario($(this).val(), null);
        $("#nombres").focus();
    }
    }
 });


  $("#cedula").change(function () {
    if (!id_funcionario_exist) {
      $("#btnMakeEditar").addClass("d-none");
      $("#delete_fun").addClass("d-none");
      //getFuncionario($(this).val(), null);
    }
  });

  $("#fecha_ingreso").change(function () {
    $("#ingreso").val(new Date($(this).val()).getFullYear());
    let fecha_ini = new Date($(this).val()).getTime(),
      fecha_fin = new Date().getTime();
    dias = (fecha_fin - fecha_ini) / (1000 * 60 * 60 * 24);
    meses_val = Math.ceil(dias / 30);
    anos = Math.floor(meses_val / 12);
    meses = Math.round(meses_val % 12) -1;
    if(meses < 0 && anos > 0){
      meses_ac = 11;
      anos_ac = anos - 1;
    } else if(meses < 0 && anos <= 0){
      meses_ac = 0;
      anos_ac = 0;
    }else{
      meses_ac = meses;
      anos_ac = anos;
    }
    valor = `${anos_ac} años, ${meses_ac} meses`;
    $("#exp_institucional").val(valor);
    meses_valida = meses_2 + meses;
    anos_gen = anos + anos_2;
    if(meses_valida < 0 && anos_gen > 0){
      anos_gen = anos + anos_2 - 1;
      meses_gen = 11;
      }else if(meses_valida < 0 && anos_gen <= 0){
        anos_gen = 0;
        meses_gen = 0;
      }else{
        meses_gen = meses_valida;
        anos_gen = anos + anos_2;
      }
    valor_gen = `${anos_gen} años, ${meses_gen} meses`;
    $("#exp_general").val(valor_gen);
    });

  $(document).on("change", "input[name=fecha_nacimiento]", function () {
    //let feche_act = new Date().getFullYear();
    //let fecha_nac = new Date($(this).val()).getFullYear();
   // let edad = feche_act - fecha_nac;
	//$(this).parents("tr").find("input[name=edad]").val(edad);
    $(this).parents("tr").find("input[name=edad]").val(calcularEdad($(this).val()));
  });

  $("#fecha_nac").change(function () {
    // let feche_act = new Date().getFullYear();
    // let fecha_nac = new Date($(this).val()).getFullYear();
    // let edad = feche_act - fecha_nac;
    $("#edad").val( calcularEdad($(this).val()));
   
  });

  $("#BtnAddDetalle").on("click", function () {
    addDetall();
    return false;
  });
  
  $(document).on("click", "#BtnAddExp", function (e) {
    e.preventDefault();
    addExp();
  });
  
 
  $(document).on("click", "button[name=btnEliminarExp]", function (e) {
    e.preventDefault();
    id_experiencia = $(this)
      .parents(".experiencia_anterior:first")
      .find("input[name=id_experiencia]")
      .val();
    eli_exp = confirm("Esta seguro  que quiere eliminar esta experiencia");
    if (id_experiencia != 0 && eli_exp) {
      eliminarExperiencia(id_experiencia);
      $(this).parents(".experiencia_anterior:first").remove();
    }
  });
  
  $(document).on("click", "#BtnAddInfAcad", function (e) {
    e.preventDefault();
    addInfoAcad();
  });


  $(document).on("click", "button[name=btnEliminarInfAcad]", function (e) {
  e.preventDefault();
let contenedor = $(this).parents(".infAcademica_anterior:first");

  let id_infoacademica = contenedor.find("input[name='id_infoacademica[]']").val();

  let confirmar = confirm("¿Está seguro que quiere eliminar esta Información Académica?");

  if (confirmar) {
   if (id_infoacademica && id_infoacademica != "0") {
      let eliminados = $("#infoAcademicaEliminados").val();
      eliminados = eliminados ? eliminados.split(",") : [];
      eliminados.push(id_infoacademica);
      $("#infoAcademicaEliminados").val(eliminados.join(","));
    }
    // Siempre elimino de la pantalla (nuevo o existente)
    contenedor.remove();
  }
});

  
  
  $(document).on("click", "button[name=eliminarDetalle]", function () {
    id_familiar = $(this).parents("tr").find("input[name=id_familia]").val();
    eli_fam = confirm("Esta seguro que quiere eliminar a este familiar");
    // Majjul
    // if (id_familiar != 0 && eli_fam) {
    if (id_familiar && eli_fam) {
      eliminarFamiliar(id_familiar);
      $(this).parents("tr").remove();
    }
    cont = Number(
      $("#tblNucleoFamiliar tbody tr:last").find("td label[for=numero]").text()
    );
    return false;
  });

  $("#nivel_educativo").change(function () {
    if ($(this).val() == 7 || $(this).val() == 8 || $(this).val() == 9)
      $("#posgrado").removeAttr("disabled");
    else $("#posgrado").prop("disabled", "disabled");
  });

  $("#nivel_sel").change(function () {
    cargo($(this).val());
  });

  $("#cargo_propiedad").change(function () {
    CargarCodigo($(this).val());
  });

  $("#codigo").change(function () {
    CargarGrado($(this).val());
  });

  // $('#archivo_lab').trigger('change');
  // $('input[name=emergencia]').click(function () {
  // if (this.attr('checked')) {
  // var rrrr = $(this).parents('.td-table').sibling('.td-table:last-child').children('input[name=contacto_emergencia]');
  // } else
  // var rrrr = $(this).parents('.td-table').sibling('.td-table:last-child').children('input[name=contacto_emergencia]');
  // console.log('No chequeado')
  // })
});

$(document).on("change", "#archivo_lab", function (e) {
  // var obj = e.target.files[0];
  reader.onload = function (f) {
    $("#contenido_xml").html(f.target.result);
  };
  reader.readAsText(obj);
});

function deleteFuncionario(id_funcionario) {
  $.post("set/hojavida/eliminar", {
    id_funcionario: id_funcionario,
  }).done(function (data) {
    data = JSON.parse(data);
    if (data.error != undefined) {
      console.log(atob(data.error));
      alertError(btoa("Error al eliminar el funcionario"));
    } else {
      alertSucces(data.success);
      setTimeout(function () {
        location.href = "?view=consultas&mode=consultarfuncionario";
      }, 1000);
    }
  });
}

function eliminarFamiliar(id_familiar) {
  $.post("ajaxGeneral.php?mode=eliminarFamiliar", {
    id_familiar: id_familiar,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error == undefined) {
        alertSucces(data.success);
      } else {
        alertError(btoa("Error al eliminar el familiar"));
        console.log(atob(data.error));
        return;
      }
    }
  });
}

function eliminarExperiencia(id_experiencia) {
  $.post("ajaxGeneral.php?mode=eliminarExperiencia", {
    id_experiencia: id_experiencia,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error == undefined) {
        alertSucces(data.success);
      } else {
        alertError(btoa("Error al eliminar la experiencia"));
        console.log(atob(data.error));
        return;
      }
    }
  });
}


function getFuncionario(cedula = null, id_funcionario = null) {
  $.post("ajaxGeneral.php?mode=getFuncionario_2", {
    id_funcionario: id_funcionario,
    documento: cedula,
  })
    .done(function (data) {
      if (data.trim() !== "") {
        data = JSON.parse(data);
        if (data.error != undefined) {
          $("#nombres").val("");
          $("#apellidos").val("");
          $("#pais_nacimiento").val(""); //majjul
          $("#ciudad_nacimiento").val(""); //majjul
          $("#otro_municipio").val(""); //majjul          
          $("#correo").val("");
          $("#telefono").val("");
          $("#direccion").val("");
          $("#municipio").val("");
          $("#fecha_nac").val("");
          $("#edad").val("");
          $("#estado").val("");
          // $("input[name=sexo]").val('')
          $("#tipo_sanguineo").val("");
          $("#etnia").val("");
          $("#victima_violencia").val("");
          $("#madre_padre").val("");
          $("#is_cabezafamilia").val("");
          $("#is_Actualizado").val("");
          $("#condicion_medica").val("");
          $("#tipo_vinculacion").val("");
          $("#fecha_ingreso").val("");
          $("#ingreso").val("");
          $("#nivel_sel").val("");
          $("#dependencia").val("");
          $("#sede").val("");
          $("#cargo_propiedad").val("");
          $("#profesion").val("");
          $("#posgrado").val("");
          $("#codigo").val("");
          $("#grado").val("");
          $("#exp_previa").val("");
          $("#exp_general").val("");
          $("#exp_institucional").val("");
          $("input[name=vivienda]").val("");
          $("#vivienda_estado").val("");
          $("#cargo_ula").val("");
          $("#dependencia_ula").val("");
          $("#sede_ula").val("");
          $("#num_posesion").val("");
          $("#fecha_posesion").val("");
          $("#num_resolucion").val("");
          $("#fecha_resolucion").val("");
          $("#modo_trabajo").val("");
          $("#archivo_lab").val("");
		      $("#archivo").val("");
          $("#nivel_educativo").val("");
          $("#pros_disc").addClass("d-none");
          $("#exp_laboral").addClass("d-none");
          $("#vivienda_car").addClass("d-none");
          $("#info_lab").addClass("d-none");
          $("#nu_fam").addClass("d-none");
          $("#info_academica").addClass("d-none");
          $("#btnMakeSaldoinicla").addClass("d-none");
          $("#info_laboral").addClass("d-none");
          $("#id_funcionario").val("");
          $(".nucleo_familia").remove();
          $("#estado_civil").val("");
          cont = 0;

          // alertError(data.error)
          return;
        }

        let contador = 0;
        dias_2 = 0;
        
        if (cedula != null && data.error == undefined) {
          alertError(btoa("Error ya existe un funcionrio registrado con este numero de cedula"));
          $("#btnMakeSaldoinicla").addClass("d-none");
          $("#btnMakeEditar").addClass("d-none");
          return;
        }

        $("#btnMakeSaldoinicla").removeAttr("disabled", "disabled");
        $("#btnMakeEditar").removeAttr("disabled", "disabled");
        $(data[0]).each(function () {
          if (this.cargo != "" || this.cargo != undefined) {
            $("#info_laboral").removeClass("d-none");
            $("#cargo_ula").val(this.cargoactual);
            $("#dependencia_ula").val(this.dependencia);
            $("#sede_ula").val(this.sedeactual);
          } else $("#info_laboral").addClass("d-none");
          $("#id_funcionario").val(
            this.id_funcionario == "" ? 0 : this.id_funcionario
          );
          getSegSocial(this.id_funcionario);
          seguridadSocial(this.documento); 

          $("#nombres").val(this.nombre);
          $("#apellidos").val(this.apellidos);
          $("#pais_nacimiento").val(this.pais_nacimiento); //majjul
          $("#ciudad_nacimiento").val(this.ciudad_nacimiento); //majjul
          $("#otro_municipio").val(this.otro_municipio); //majjul
		      $("#foto").val(this.archivo);
          $("#arch_lab").val(this.archivo_laboral);
		      $('#blah').attr('src', this.archivo);
		      $('#blah').attr("style", "display:block ; padding:3px ;background-color: #f5f5f5; width: 90px;height: 110px;border: 1px solid #999999;")
		  		  
		  
          $("#correo").val(this.email);
          $("#telefono").val(this.celular);
          $("#cedula").val(this.documento);
          $("#direccion").val(this.direccion);
          $("#municipio").val(this.id_municipio);
          $("#fecha_nac").val(this.fecha_nacimiento);
          $("#num_posesion").val(this.numero_posesion);
          $("#fecha_posesion").val(this.fecha_posesion);
          $("#num_resolucion").val(this.numero_resolucion);
          $("#fecha_resolucion").val(this.fecha_resolucion);
          $("#modo_trabajo").val(this.modo_trabajo);
		  if (this.archivo_laboral && this.archivo_laboral !== "") {
			let basePath = "";
			let fileUrl = basePath + this.archivo_laboral;
			  // crea un link de descarga / visualización
			 // crea un link de descarga
			let link = `<a href="${fileUrl}" download class="btn btn-success">
              <i class="fa fa-download"></i> Descargar archivo adjunto
            </a>`;
			  $("#archivo_lab_vista").html(link);
			} else {
			  $("#archivo_lab_vista").html('<small class="text-muted"><i class="fa fa-info-circle"></i> No hay archivo cargado</small>');

			}

          $("#edad").val(this.edad);
          $("input[name=sexo]").val([this.genero]);
          $("#tipo_sanguineo").val(this.id_rh);
          $("#etnia").val(this.id_etnia);
          $("#victima_violencia").val(this.id_victimaviolencia);
          $("#madre_padre").val(this.madre_padre);
          $("#is_cabezafamilia").val(this.cabeza_familia);
          $("#is_Actualizado").val(this.is_actualizado);
          $("#condicion_medica").val(this.condicion_medica);
          $("#tipo_vinculacion").val(this.id_tipovinculacion);
          $("#fecha_ingreso").val(this.fecha_ingreso_nombra);
          ///$("#nivel_educativo").val(this.id_niveleducativo);
          //$("#profesion").val(this.profesion);
          //$("#posgrado").val(this.posgrado);
          $("input[name=vivienda]")
            .filter("[value=" + this.is_viviendapropia + "]")
            .attr("checked", true);
          $("input[name=procesos_disc]")
            .filter("[value=" + this.is_procesodisciplinario + "]")
            .attr("checked", true);
          if (this.is_procesodisciplinario == 1) {
            $(".proceso_disciplinario").removeClass("d-none");
            $("#numero_proceso").attr("required", "required");
            $("#fecha_proceso").attr("required", "required");
            $("#numero_proceso").val(
              this.numero_proceso_dis == null ? "" : this.numero_proceso_dis
            );
            $("#fecha_proceso").val(
              this.fecha_proceso_dis == null ? "" : this.fecha_proceso_dis
            );
          } else {
            $(".proceso_disciplinario").addClass("d-none");
            $("#numero_proceso").removeAttr("required");
            $("#fecha_proceso").removeAttr("required");
          }
          $("#vivienda_estado").val(this.estado_vivienda);
          $("#ingreso").val(this.ano_ingreso);
          $("#nivel_sel").val(this.id_nivelfuncionario);
          $("#estado").val(this.is_activo);
          cargo(this.id_nivelfuncionario, this.id_cargo);
          CargarCodigo(this.id_cargo, this.id_codigo);
          CargarGrado(this.id_codigo, this.id_grado);
          $("#dependencia").val(this.id_dependencia);
          $("#sede").val(this.id_sede);
          $("#estado_civil").val(this.id_estadocivil);
          $("input[name=vivienda]")
            .filter("[value=" + this.is_viviendapropia + "]")
            .attr("checked", true);
          $("#exp_laboral").removeClass("d-none");
          $("#pros_disc").removeClass("d-none");
          $("#vivienda_car").removeClass("d-none");
          $("#info_lab").removeClass("d-none");
          $("#nu_fam").removeClass("d-none");
          $("#info_academica").removeClass("d-none");
          $("#btnMakeSaldoinicla").removeClass("d-none");
          $("#experiencia_cont").html("");

          $("#tblNucleoFamiliar tbody").html("");
          meses = 0;
          anos = 0;
          dias = 0;
          let fecha_ini = new Date(this.fecha_ingreso_nombra).getTime(),
          fecha_fin = new Date().getTime();
        dias = (fecha_fin - fecha_ini) / (1000 * 60 * 60 * 24);
        meses_val = Math.ceil(dias / 30);
        anos = Math.floor(meses_val / 12);
        meses = Math.round(meses_val % 12) -1;
        if(meses < 0 && anos > 0){
          meses_ac = 11;
          anos_ac = anos + anos_2 - 1;
        } else if(meses < 0 && anos <= 0){
          meses_ac = 0;
          anos_ac = 0;
        }else{
          meses_ac = meses;
          anos_ac = anos;
        }
        valor = `${anos_ac} años, ${meses_ac} meses`;
        $("#exp_institucional").val(valor);
        mes_valida = meses_2 + meses;
        anos_gen = anos + anos_2 - 1;
        if(mes_valida < 0 && anos_gen > 0){
        anos_gen = anos + anos_2 - 1;
        meses_gen = 11;
        }else if(mes_valida < 0 && anos_gen <= 0){
          anos_gen = 0;
          meses_gen = 0;
        }else{
          meses_gen = mes_valida;
          anos_gen = anos + anos_2;
        }
        valor_gen = `${anos_gen} años, ${meses_gen} meses`;
		
        $("#exp_general").val(valor_gen);
          $.each(this.experiencia, function () {
            if (this.empresa != null) {
              let fecha_ini = new Date(this.fecha_ingreso).getTime(),
                fecha_fin = new Date(this.fecha_retiro).getTime();
              // dias_2 = 0;
              dias_2 += (fecha_fin - fecha_ini) / (1000 * 60 * 60 * 24);

              let experiencia = `<div class="row experiencia_anterior">
              <div class="col-md-12">
                <hr>
              </div>
              <div class="row padding-secciones">
              <input type="hidden" class="id_experiencia" value="${
                this.id_experienciaprevia == "" ? 0 : this.id_experienciaprevia
              }" name="id_experiencia">
              <div class="row">
                <div class="col-md-3 mb-2">
                  <button class="btn btn-danger btn-sm desactivar" disabled name="btnEliminarExp" style="float:left" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>
                </div>  
              </div>  
                <div class="col-md-6 mb-2">
                  <label class="label-form" for="nombre_empresa">Nombre de la empresa</label>
                  <input type="text" required disabled class="form-control input-form color-t border-required desactivar" value="${
                    this.empresa
                  }" name="nombre_empresa" placeholder="Empresa...">
                </div>
                <div class="col-md-6 mb-2">
                  <label class="label-form" for="cargo_exp">Cargo</label>
                  <input type="text" required disabled class="form-control input-form color-t border-required desactivar" value="${
                    this.cargo
                  }" name="cargo_exp" placeholder="Cargo...">
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="fecha_ingreso_exp">Fecha de Ingreso</label>
                  <input type="date" required class="form-control input-form color-t border-required fecha_ingreso_exp desactivar" disabled value="${
                    this.fecha_ingreso
                  }" name="fecha_ingreso_exp">
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="fecha_retiro_exp">Fecha de Retiro</label>
                  <input type="date" required class="form-control input-form color-t border-required fecha_retiro_exp desactivar" disabled value="${
                    this.fecha_retiro
                  }" name="fecha_retiro_exp">
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="funciones_exp">Funciones</label>
                  <input type="text" required class="form-control input-form color-t border-required desactivar" disabled value="${
                    this.funciones
                  }" id="funciones_exp" name="Funciones_exp" placeholder="Funciones...">
                </div>
              </div>
              </div>`;
              $("#experiencia_cont").append(experiencia);
            }
            meses_2 = 0;
            anos_2 = 0;
            meses_val = Math.ceil(dias_2 / 30);
            anos_2 = Math.floor(meses_val / 12);
            meses_2 = Math.round(meses_val % 12)-1;
            if(meses_2 < 0 && anos_2 > 0){
              meses2_ac = 11;
              anos2_ac = anos_2 - 1;
            } else if(meses_2 < 0 && anos_2 <= 0){
              meses2_ac = 0;
              anos2_ac = 0;
            }else{
              meses2_ac = meses_2;
              anos2_ac = anos_2;
            }
            valor = `${anos2_ac} años, ${meses2_ac} meses`;
            $("#exp_previa").val(valor);
            meses_valida = meses_2 + meses;
            anos_gen = anos + anos_2;
            if(meses_valida < 0 && anos_gen > 0){
              anos_gen = anos + anos_2 - 1;
              meses_gen = 11;
            }else if(meses_valida < 0 && anos_gen <= 0){
              anos_gen = 0;
              meses_gen = 0;
            }else{
              meses_gen = meses_valida;
              anos_gen = anos + anos_2;
            }
            valor_gen = `${anos_gen} años, ${meses_gen} meses`;
            $("#exp_general").val(valor_gen);
          });
          
          $.each(this.nucleo_familia, function () {
            let id = this.id_nucleofamiliar;
            contador += 1;
            let familia = `<tr class='nucleo_familia'>
          <td class="td-table d-none"><input value="${
            this.id_nucleofamiliar == "" ? 0 : this.id_nucleofamiliar
          }" type="hidden" name="id_familia"></td>
          <td class="td-table" style="text-align: center;"><label for="numero">${contador}</label></td>
          <td class="td-table"><input type="text" class="form-control input-table desactivar" name="nombre" value="${ this.nombres }" placeholder="Nombres..." disabled required=""></td>
          <td class="td-table"><input type="text" class="form-control input-table desactivar" name="apellido" value="${ this.apellidos }" placeholder="Apellidos..." disabled required=""></td>
          <td class="td-table">
            <select class="form-control input-table parentesco desactivar" id="parentesco-${ id }" disabled name="parentesco" placeholder='Parentesco...' required="">
              ${parentesco}
            </select>
          </td>
          <!--<td class="td-table"><input type="text" class="form-control input-table" name="parentesco_otro" disabled placeholder="Parentesco..." value="${ this.parentesco }"></td>-->
          <td> <input type="date" class="form-control input-table desactivar" id="parentesco-fecha-${ id }" name="fecha_nacimiento" disabled required=""> </td>
          <td class="td-table"><input type="text" disabled class="form-control input-table desactivar" name="edad" value="${ this.edad }" placeholder="Edad..." required=""></td>
          <td class="td-table" style="text-align: center;"> <input type="checkbox" style="width: 21px;height: 21px;" name="emegencia" ${ this.is_emergencia == 1 ? "checked" : "" } class="form-check-input desactivar emergencia_check" disabled> </td>
          <td class="td-table d-flex" style="text-align: center;">
            <input type="text" class="form-control input-table ${
              this.is_emergencia == 1 ? "" : "d-none"
            } contacto_emergencia desactivar" disabled name="contacto_emergencia" value="${
              this.contacto
            }" placeholder="Contacto Emergencia...">
            <input type="text" class="form-control input-table ${ 
              this.is_emergencia == 1 ? "" : "d-none" 
            } contacto_emergencia desactivar" disabled name="contacto_emergencia_2" value="${
              this.contacto_2
            }" placeholder="Contacto 2 Emergencia..." style="margin-left: 1px;">
          </td>
          <td>
            <button class="btn btn-danger btn-sm desactivar" disabled name="eliminarDetalle"><i class="fa fa-trash-o"></i></button>
          </td>
        </tr>`;
            $("#tblNucleoFamiliar tbody").append(familia);
            // $("#tblNucleoFamiliar tbody select[id=parentesco-]").val(
            //   this.id_parentesco
            // );
            $(`#parentesco-${ id }`).val(this.id_parentesco);
            // $("#tblNucleoFamiliar tbody input[name=fecha_nacimiento]").val(
            //   this.fecha_nacimiento
            // );
            $(`#parentesco-fecha-${ id }`).val(this.fecha_nacimiento);
          });
		  
		  
		  $.each(this.informacion_academica, function () {
            let id = this.id_infoacademica;
            contador += 1;
           // Convertir el string en objeto jQuery
    let fila = $(`
  <div class="row padding-secciones infAcademica_anterior">
    <div class="row">
      <div class="col-md-3 mb-3">
      
        <button class="btn btn-danger btn-sm desactivar" 
                name="btnEliminarInfAcad" 
                style="float:left" type="button" disabled>
          <i class="fa fa-trash-o"></i> ELIMINAR
        </button>
      </div>
    </div>
    <div class="row padding-secciones">
      <input type="hidden" class="id_infoacademica" value="${this.id_infoacademica}" name="id_infoacademica[]">

      <div class="col-md-6 mb-3">
        <label class="label-form">Nivel educativo</label>
        <select class="form-control input-form color-t border-required desactivar nivel_educativo" 
                name="nivel_educativo[]" disabled>
        </select>
      </div>

      <div class="col-md-6 mb-3">
        <label class="label-form">Profesión</label>
        <input type="text" class="form-control input-form color-t border-required desactivar"
               value="${this.profesion}" name="profesion[]" placeholder="Profesión..." disabled>
      </div>

      <div class="col-md-4 mb-3">
        <label class="label-form">Posgrado</label>
       <textarea class="form-control input-form color-t border-required desactivar"
          name="posgrado[]" placeholder="Posgrado..." disabled>${this.posgrado}</textarea>
      </div>
       <div class="col-md-8 mb-2">
            <label class="label-form"></label>
            <input type="file" 
            name="archivo_academico[]" disabled>
        
        <div id="archivo_academico_vista" class="mt-2">
        <small class="form-text text-muted">Suba el diploma, certificado u otro documento relacionado.</small>
        </div>  <!-- Mostrar el enlace de descarga aquí -->
  </div>
    </div>
  </div>
`);

// Verificar si hay un archivo ya cargado para mostrar el enlace de descarga
    if (this.archivo_academico && this.archivo_academico !== "") {
        let basePath = "";  // Ruta donde se encuentran los archivos
        let fileUrl = basePath + this.archivo_academico;

        // Crear enlace de descarga
        let link = `<a href="${fileUrl}" download class="btn btn-success">
                        <i class="fa fa-download"></i> Descargar archivo adjunto
                    </a>`;
        
        // Mostrar el enlace de descarga en el contenedor de archivo
        fila.find("#archivo_academico_vista").html(link);
    } else {
        // Si no hay archivo, mostrar el mensaje correspondiente
        fila.find("#archivo_academico_vista").html('<small class="text-muted"><i class="fa fa-info-circle"></i> No hay archivo cargado</small>');
    }

    
let select = fila.find(".nivel_educativo");
nivelEducativo2(select, this.id_niveleducativo);

    // Insertar en el contenedor
    $("#infoAcad_cont").append(fila);
             
            // $("#tblNucleoFamiliar tbody select[id=parentesco-]").val(
            //   this.id_parentesco
            // );
            $(`#parentesco-${ id }`).val(this.id_parentesco);
            // $("#tblNucleoFamiliar tbody input[name=fecha_nacimiento]").val(
            //   this.fecha_nacimiento
            // );
            $(`#parentesco-fecha-${ id }`).val(this.fecha_nacimiento);

   
          });
		  
		  
		  
		  
        });
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


function cargarInfoAcademicaborr(id_funcionario) {
  $.ajax({
    url: "ajaxGeneral.php?mode=getinfoacademica",
    type: "POST",
    data: { id_funcionario: id_funcionario },
    dataType: "json",
    success: function(data) {
      $("#infoAcad_cont").empty(); // limpia el contenedor

      if (data.length > 0) {
        data.forEach(function(item) {
          let fila = `
            <div class="row padding-secciones infAcademica_anterior">
              <div class="row">
                <div class="col-md-3 mb-3">
                  <button class="btn btn-danger btn-sm desactivar" name="btnEliminarInfAcad" style="float:left" type="button">
                    <i class="fa fa-trash-o"></i> ELIMINAR
                  </button>
                </div>
              </div>
              <div class="row padding-secciones">
                <input type="hidden" class="id_infoacademica" value="${item.id_infoacademica}" name="id_infoacademica[]">

                <div class="col-md-6 mb-3">
                  <label class="label-form">Nivel educativo</label>
                  <select class="form-control input-form color-t border-required desactivar">
                    <option value="1" ${item.id_niveleducativo==1?"selected":""}>Primaria</option>
                    <option value="2" ${item.id_niveleducativo==2?"selected":""}>Secundaria</option>
                    <option value="3" ${item.id_niveleducativo==3?"selected":""}>Técnico</option>
                    <option value="4" ${item.id_niveleducativo==4?"selected":""}>Tecnólogo</option>
                    <option value="5" ${item.id_niveleducativo==5?"selected":""}>Profesional</option>
                    <option value="6" ${item.id_niveleducativo==6?"selected":""}>Postgrado</option>
                  </select>
                </div>

                <div class="col-md-6 mb-3">
                  <label class="label-form">Profesión</label>
                  <input type="text" class="form-control input-form color-t border-required desactivar"
                         value="${item.profesion}" name="profesion" placeholder="Profesión...">
                </div>

                <div class="col-md-4 mb-3">
                  <label class="label-form">Posgrado</label>
                  <input type="text" class="form-control input-form color-t border-required"
                         value="${item.posgrado}" name="posgrado" placeholder="Posgrado...">
                </div>
              </div>
            </div>`;
          $("#infoAcad_cont").append(fila);
        });
      } else {
        $("#infoAcad_cont").append("<p>No hay información académica registrada.</p>");
      }
    }
  });
}


function experienciaInst(id_funcionario) {
  $.post("ajaxGeneral.php?mode=experienciaInst", {
    id_funcionario: id_funcionario,
    id_movilidad: "",
  }).done((data) => {
    data = JSON.parse(data);
    if (data.error != undefined) {
      $("#exp_laboral_inst").addClass("d-none");
      // alertError(data.error)
      return;
    } else {
      let exp_inst = "";
      dias = 0;
      meses = 0;
      $("#exp_laboral_inst").removeClass("d-none");
      $(data).each(function () {
        let fecha_ini = new Date(this.fecha_ini).getTime(),
          fecha_fin = new Date(this.fecha_fin).getTime();
        // dias += ((fecha_fin - fecha_ini) / (1000 * 60 * 60 * 24))
        exp_inst += `
        <div class="row padding-secciones">
          <div class="col-md-4 mb-2">
            <label class="label-form" for="cargo_exp_inst">Cargo</label>
            <input type="text" class="form-control input-form color-t border-required cargo_exp_inst" id="" name="cargo_exp_inst" value="${this.cargo}" disabled placeholder="Cargo...">
          </div>
          <div class="col-md-4 mb-2">
            <label class="label-form" for="fecha_ing_exp_inst">Fecha de Ingreso</label>
            <input type="date" disabled class="form-control input-form color-t border-required fecha_ing_exp_inst" id="" value="${this.fecha_ini}" name="fecha_ing_exp_inst">
          </div>
          <div class="col-md-4 mb-2">
            <label class="label-form" for="fecha_ret_exp_inst">Fecha de Retiro</label>
            <input type="date" disabled class="form-control input-form color-t border-required fecha_ret_exp_inst" id="" value="${this.fecha_fin}" name="fecha_ret_exp_inst">
          </div>
          <div class="col-md-8 mb-2">
            <label class="label-form" for="funciones_exp_inst">Funciones</label>
            <textarea disabled class="form-control input-form color-t border-required funciones_exp_inst" name="Funciones_exp_inst" placeholder="Funciones...">${this.funciones}</textarea>
          </div>
        </div>
        <hr>`;
      });
      // meses = Math.ceil(dias / 30)
      // $('#exp_institucional').val(meses)
      // $('#exp_general').val(meses_2 + meses);
      $("#experiencia_inst").html(exp_inst);
    }
  });
}

function getSegSocial(id_funcionario) {
  $.post("ajaxGeneral.php?mode=getSegSocial", {
    id_funcionario: id_funcionario,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error != undefined) {
        // alertError(data.error)
        $("#seguridad_social").addClass("d-none");
        return;
      }
      $("#seguridad_social").removeClass("d-none");
      $(data).each(function () {
        $("#eps_ula").val(this.eps);
        $("#admin_pension_ula").val(this.fondo_pension);
        $("#censantias_ula").val(this.fondo_cesantias);
        $("#arl_ula").val(this.arl);
        $("#compensacion_ula").val(this.caja_compensacion);
        $("#ret_segurdad_ula").val(this.fecha_retiro);
      });
    }
  });
}

function getIncapacidad(id_funcionario) {
  $.post("ajaxGeneral.php?mode=getIncapacidad", {
    id_funcionario: id_funcionario,
    id_incapacidad: "",
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      if (data.error != undefined) {
        // alertError(data.error)
        $("#incapacidad").addClass("d-none");
        return;
      }
      $("#incapacidad").removeClass("d-none");
      $(data).each(function () {
        $("#tipo_inc").val(this.tipo_incapacidad);
        $("#fecha_inc").val(this.fecha_ini);
        $("#dias_inc").val(this.dias);
      });
    }
  });
}

function seguridadSocial(cedula) {
  $.post("ajaxGeneral.php?mode=seguridadSocial", {
    cedula: cedula,
  }).done(function (data) {
    data = JSON.parse(data);
    // console.log(data);
    let sel = '<option value="" selected>Seleccione...</option>';
    if (data.error != undefined) {
    } else {
      $("#eps_ula").val(data.eps);
      $("#admin_pension_ula").val(data.fondo_pension);
      $("#censantias_ula").val(data.fondo_cesantias);
      $("#arl_ula").val(data.arl);
      $("#compensacion_ula").val(data.caja_compensacion);
      $("#ret_segurdad_ula").val(data.fecha_retiro);
    }
  });
}

function rh() {
  $.post("ajaxGeneral.php?mode=rh").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let sel = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          sel += `<option value="${this.id_rh}">${this.rh}</option>`;
        });
      }
      $("#tipo_sanguineo").html(sel);
    }
  });
}

function CargarEtnia() {
  $.post("ajaxGeneral.php?mode=etnia").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let sel = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          sel += `<option value="${this.id_etnia}">${this.etnia}</option>`;
        });
      }
      $("#etnia").html(sel);
    }
  });
}

function Parentesco() {
  $.post("ajaxGeneral.php?mode=parentesco").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      parentesco = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          parentesco += `<option value="${this.id_parentesco}">${this.parentesco}</option>`;
        });
      }
      $("select[name=parentesco]").html(parentesco);
    }
  });
}


function nivelEducativo() {
  $.post("ajaxGeneral.php?mode=nivelEducativo").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          educa += `<option value="${this.id_niveleducativo}">${this.nivel_educativo}</option>`;
        });
      }
      $("#nivel_educativo").html(educa);
    }
  });
}

function nivelEducativo_copia() {
  $.post("ajaxGeneral.php?mode=nivelEducativo").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          educa += `<option value="${this.id_niveleducativo}">${this.nivel_educativo}</option>`;
        });
      }
      $("#nivel_educativo").html(educa);
    }
  });
}


function addInfoAcad() {
   var InfoAcad = $(`
    <div class="row padding-secciones infoAcad_cont">
      <div class="row padding-secciones infAcademica_anterior">
        <div class="row">
          <div class="col-md-3 mb-2">
            <button class="btn btn-danger btn-sm desactivar" name="btnEliminarInfAcad" style="float:left" type="button"> 
              <i class="fa fa-trash-o"></i> ELIMINAR
            </button>
          </div>
        </div>
        <div class="row padding-secciones">
          <input type="hidden" class="id_infoacademica" value="0" name="id_infoacademica[]">
          
          <div class="col-md-6 mb-2">
            <label class="label-form">Nivel educativo <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar nivel_educativo"
                    name="nivel_educativo[]" ></select>
            <div class="invalid-feedback">Debe seleccionar el Nivel educativo</div>
          </div>
          
          <div class="col-md-6 mb-2">
            <label class="label-form">Profesión</label>
            <input type="text" class="form-control input-form color-t border-required desactivar" 
                   name="profesion[]" placeholder="Profesión...">
            <div class="invalid-feedback">Debe seleccionar la Profesión</div>
          </div>
          
          <div class="col-md-4 mb-2">
            <label class="label-form">Posgrado</label>
           <textarea class="form-control input-form color-t border-required desactivar"
          name="posgrado[]" placeholder="Posgrado..." disabled>${this.posgrado}</textarea>
            <div class="invalid-feedback">Debe seleccionar el Posgrado</div>
          </div>
           <div class="col-md-8 mb-2">
            <label class="label-form"></label>
            <input type="file" name="archivo_academico[]"><br>
            <small class="form-text text-muted">Suba el diploma, certificado u otro documento relacionado.</small>
          </div>
        </div>
      </div>
    </div>
  `);

  // 👉 Agregar nueva sección
  $("#infoAcad_cont").append(InfoAcad);

  // 👉 Rellenar SOLO el select de la nueva sección
  nivelEducativo2(InfoAcad.find(".nivel_educativo"));
}

function nivelEducativo2($select, selectedValue = null) {
   $.post("ajaxGeneral.php?mode=nivelEducativo").done(function (data) {
      if (data.trim() !== "") {
         data = JSON.parse(data);
         let educa = '<option value="">Seleccione...</option>';
         if (data.error != undefined) {
            alertError(data.error);
            return;
         } else {
            $.each(data, function () {
               educa += `<option value="${this.id_niveleducativo}">${this.nivel_educativo}</option>`;
            });
         }
         $select.html(educa); // ✅ llena solo ese select

         // 👉 Seleccionar valor después de llenar
         if (selectedValue) {
            $select.val(selectedValue);
         }
      }
   });
}


function vinculacion() {
  $.post("ajaxGeneral.php?mode=Vinculacion").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let educa = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          educa += `<option value="${this.id_tipovinculacion}">${this.tipo_vinculacion}</option>`;
        });
      }
      $("#tipo_vinculacion").html(educa);
    }
  });
}

function CargarNivel() {
  $.post("ajaxGeneral.php?mode=nivel").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let nivel = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          nivel += `<option value="${this.id_nivelfuncionario}">${this.nivel}</option>`;
        });
      }
      $("#nivel_sel").html(nivel);
    }
  });
}

function cargo(nivel, id_cargo = null) {
  // nivel = $('#nivel').val();
  $.post("ajaxGeneral.php?mode=cargo", {
    nivel_funcionario: nivel,
  }).done(function (data) {
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
      $("#cargo_propiedad").html(cargo);
      if (id_cargo != null) $("#cargo_propiedad").val(id_cargo);
    }
  });
}

function CargarCodigo(id_cargo, id_codigo = null) {
  $.post("ajaxGeneral.php?mode=codigo", {
    cargo: id_cargo,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let codigo = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          codigo += `<option value="${this.id_codigo}">${this.codigo}</option>`;
        });
      }
      $("#codigo").html(codigo);
      if (id_codigo != null) $("#codigo").val(id_codigo);
    }
  });
}

function CargarGrado(id_codigo, id_grado = null) {
  $.post("ajaxGeneral.php?mode=grado", {
    codigo: id_codigo,
  }).done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let grado = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          grado += `<option value="${this.id_grado}">${this.grado}</option>`;
        });
      }
      $("#grado").html(grado);
      if (id_grado != null) $("#grado").val(id_grado);
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
      $("#sede").html(sede);
    }
  });
}

function CargarDependencia() {
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
    }
  });
}

function CargarVictima() {
  $.post("ajaxGeneral.php?mode=victima").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let dependencia = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          dependencia += `<option value="${this.id_victimaviolencia}">${this.nombre}</option>`;
        });
      }
      $("#victima_violencia").html(dependencia);
    }
  });
}

function CargarMunicipio() {
  $.post("ajaxGeneral.php?mode=municipio").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let municipio = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          municipio += `<option value="${this.id_municipio}">${this.municipio}</option>`;
        });
      }
      $("#municipio").html(municipio);

      let params = new URLSearchParams(location.search);
      var id_funcionario = params.get("id_funcionario");
      if (id_funcionario != null) {
        id_funcionario_exist = true;
        $(".desactivar").attr("disabled", "disabled");
        getFuncionario(null, id_funcionario);
        getIncapacidad(id_funcionario);
        experienciaInst(id_funcionario);
      }
    }
  });
}

function estado_civil() {
  // nivel = $('#nivel').val();
  $.post("ajaxGeneral.php?mode=estado_civil").done(function (data) {
    if (data.trim() !== "") {
      data = JSON.parse(data);
      // console.log(data);
      let estado_c = '<option value="" selected>Seleccione...</option>';
      if (data.error != undefined) {
        alertError(data.error);
        return;
      } else {
        $.each(data, function () {
          estado_c += `<option value="${this.id_estadocivil}">${this.estado_civil}</option>`;
        });
      }
      $("#estado_civil").html(estado_c);
    }
  });
}
// $.ajax({
//       type: "POST",
//       url: 'ajaxGenerics.php?mode=login',
//       data: {
//         usuario: $("#usuario").val(),
//         password: $("#password").val()
//       },
//       success: function (response) {
//         var jsonData = JSON.parse(response);
//         if (jsonData.success == true) {
//           location.href = 'index.php?view=principal'
//         } else {
//           alert("Usuario y/o contraseña incorrecta");
//         }
//       }

// function CargarDependencia(){
//   $.post('ajaxGeneral.php?mode=dependencia')
//   .done(function(data){
//     if (data.trim() !== '') {
//       data = JSON.parse(data);
//       // console.log(data);
//       let codigo = '<option value="" selected>Seleccione...</option>';
//       if (data.error != undefined) {
//         alert(data.error);
//       }else{
//         $.each(data, function() {
//           codigo +=`<option value="${this.id_dependencia}">${this.dependencia}</option>`;
//       });
//       }
//       $('#codigo').html(codigo);
//     }
//   })
// }

function addDetall() {
  var fila = `<tr class='nucleo_familia'>
              <td class="td-table d-none"><input value="0" type="hidden" name="id_familia"></td>
              <td class="td-table" style="text-align: center;"><label for="numero">${cont}</label></td>
              <td class="td-table"><input type="text" required class="form-control input-table" name="nombre" placeholder="Nombres..."></td>
              <td class="td-table"><input type="text" required class="form-control input-table" name="apellido" placeholder="Apellidos..."></td>
              <td class="td-table">
              <select class="form-control required input-table parentesco" name="parentesco" placeholder='Parentesco...'>
              ${parentesco}
              </select>
              </td>
              <td class="td-table"><input type="text" class="form-control input-table" name="parentesco_otro" disabled placeholder="Parentesco..."></td>
              <td>
                <input type="date" class="form-control input-table" name="fecha_nacimiento">
              </td>
              <td class="td-table"><input type="number" disabled class="form-control input-table" name="edad" placeholder="Edad..."></td>
              <td class="td-table" style="text-align: center;">
                <input type="checkbox" style="width: 21px;height: 21px;" name="emegencia" class="form-check-input emergencia_check">
              </td>
              <td class="td-table d-flex" style="text-align: center;">
                <input type="number" class="form-control input-table d-none contacto_emergencia" name="contacto_emergencia" placeholder="Contacto Emergencia...">
                <input type="number" class="form-control input-table d-none contacto_emergencia" name="contacto_emergencia_2" placeholder="Contacto 2 Emergencia..." style="margin-left: 1px;">
              </td>
              <td>
                <button class="btn btn-danger btn-sm" name="eliminarDetalle"><i class="fa fa-trash-o"></i></button>
              </td>
            </tr>`;
  cont++;
  $("#tblNucleoFamiliar tbody").append(fila);
}

function addExp() {
  var exp = `<div class="row experiencia_anterior">
              <div class="col-md-12">
                <hr>
              </div>
              <div class="row padding-secciones">
            <input type="hidden" class="id_experiencia" value="0" name="id_experiencia">
              <div class="row">
                <div class="col-md-3 mb-2">
                  <button class="btn btn-danger btn-sm" name="btnEliminarExp" style="float:left" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>
                </div>  
              </div>  
              <div class="col-md-6 mb-2">
                <label class="label-form" for="nombre_empresa">Nombre de la empresa</label>
                <input type="text" required class="form-control input-form color-t border-required"  name="nombre_empresa" placeholder="Empresa...">
              </div>
              <div class="col-md-6 mb-2">
                <label class="label-form" for="cargo_exp">Cargo</label>
                <input type="text" required class="form-control input-form color-t border-required"  name="cargo_exp" placeholder="Cargo...">
              </div>
              <div class="col-md-4 mb-2">
                <label class="label-form" for="fecha_ingreso_exp">Fecha de Ingreso</label>
                <input type="date" required class="form-control input-form color-t border-required fecha_ingreso_exp" name="fecha_ingreso_exp">
              </div>
              <div class="col-md-4 mb-2">
                <label class="label-form" for="fecha_retiro_exp">Fecha de Retiro</label>
                <input type="date" required class="form-control input-form color-t border-required fecha_retiro_exp" id="fecha_retiro_exp" name="fecha_retiro_exp">
              </div>
              <div class="col-md-4 mb-2">
                <label class="label-form" for="funciones_exp">Funciones</label>
                <input type="text" required class="form-control input-form color-t border-required"  name="Funciones_exp" placeholder="Funciones...">
              </div>
            </div>
          </div>`;
  $("#experiencia_cont").append(exp);
}

/*
function addInfoAcad() {
  var InfoAcad = `<div id="infoAcad_cont" class="row padding-secciones">
            <div class="row padding-secciones infAcademica_anterior">
              <div class="row">
                <div class="col-md-3 mb-2">
                  <button class="btn btn-danger btn-sm desactivar" name="btnEliminarInfAcad" style="float:left" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>
                </div>
              </div>
              <div class="row padding-secciones">
                <input type="hidden" class="id_infoAcademica" value="0" name="id_infoAcademica">
                <div class="col-md-6 mb-2">
						<label class="label-form" for="nivel_educativo">Nivel educativo <span style="color: red;">*</span></label>
					  <select class="form-control input-form color-t border-required desactivar" id="nivel_educativo" placeholder='Nivel educativo...' >
					  </select>
					  <div class="invalid-feedback">
						Debe seleccionar el Nivel educativo
					  </div>
			  </div>
                <div class="col-md-6 mb-2">
                  <label class="label-form" for="profesion">Profesión</label>
					  <input type="text" class="form-control input-form color-t border-required desactivar" id="profesion" name="profesion" placeholder="Profesión...">
					  <div class="invalid-feedback">
						Debe seleccionar el Profesión
					  </div>
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="posgrado">Posgrado</label>
              <input type="text" class="form-control input-form color-t border-required" id="posgrado" name="posgrado" disabled placeholder="Posgrado...">
              <div class="invalid-feedback">
                Debe seleccionar el Posgrado
              </div>
                </div>
               
              </div>
            </div>
          </div>`;
  $("#infoAcad_cont").append(InfoAcad);
}
*/
// function addExp() {
//   var exp = `<div class="col-md-12">
//   <hr>
// </div>
// <div class="row padding-secciones">
//   <div class="col-md-4 mb-2">
//     <label class="label-form" for="cargo_exp_inst">Cargo</label>
//     <input type="text" class="form-control input-form color-t border-required cargo_exp_inst" id="" name="cargo_exp_inst" disabled placeholder="Cargo...">
//   </div>
//   <div class="col-md-4 mb-2">
//     <label class="label-form" for="fecha_ing_exp_inst">Fecha de Ingreso</label>
//     <input type="date" disabled class="form-control input-form color-t border-required fecha_ing_exp_inst" id="" name="fecha_ing_exp_inst">
//   </div>
//   <div class="col-md-4 mb-2">
//     <label class="label-form" for="fecha_ret_exp_inst">Fecha de Retiro</label>
//     <input type="date" disabled class="form-control input-form color-t border-required fecha_ret_exp_inst" id="" name="fecha_ret_exp_inst">
//   </div>
//   <div class="col-md-8 mb-2">
//     <label class="label-form" for="funciones_exp_inst">Funciones</label>
//     <textarea disabled class="form-control input-form color-t border-required funciones_exp_inst" name="Funciones_exp_inst" placeholder="Funciones..."></textarea>
//   </div>
// </div>`;
//   $('#experiencia_cont').append(exp);
// }

function GuardarFuncionario() {
  let parientes = [];
  let experiencia_ant = [];
  let infAcademica_ant = [];
  
  $("#tblNucleoFamiliar .nucleo_familia").each(function () {
    fila = {
      id_familia:
        $(this).find("input[name=id_familia]").val() == ""
          ? 0
          : $(this).find("input[name=id_familia]").val(),
      apellido_p:
        $(this).find("input[name=apellido]").val() == ""
          ? ""
          : $(this).find("input[name=apellido]").val(),
      nombre_p:
        $(this).find("input[name=nombre]").val() == ""
          ? ""
          : $(this).find("input[name=nombre]").val(),
      edad_p:
        $(this).find("input[name=edad]").val() == ""
          ? 0
          : $(this).find("input[name=edad]").val(),
      parentesco_p:
        $(this).find(".parentesco").val() == ""
          ? ""
          : $(this).find(".parentesco").val(),
      parentesco_otro:
        $(this).find("input[name=parentesco_otro]").val() == ""
          ? ""
          : $(this).find("input[name=parentesco_otro]").val(),
      fecha_nac_p:
        $(this).find("input[name=fecha_nacimiento]").val() == ""
          ? null
          : $(this).find("input[name=fecha_nacimiento]").val(),
      emergencia:
        $(this).find("input[name=emegencia]").is(":checked") == true ? 1 : 0,
      contacto_emergencia:
        $(this).find("input[name=contacto_emergencia]").val() == ""
          ? ""
          : $(this).find("input[name=contacto_emergencia]").val(),
      contacto_emergencia_2:
        $(this).find("input[name=contacto_emergencia_2]").val() == ""
          ? ""
          : $(this).find("input[name=contacto_emergencia_2]").val(),
    };
    parientes.push(fila);
  });
  
  
  $("#experiencia_cont .experiencia_anterior").each(function () {
    fila = {
      nombre_emp:
        $(this).find("input[name=nombre_empresa]").val() == ""
          ? ""
          : $(this).find("input[name=nombre_empresa]").val(),
      cargo_exp:
        $(this).find("input[name=cargo_exp]").val() == ""
          ? ""
          : $(this).find("input[name=cargo_exp]").val(),
      fecha_ingreso_exp:
        $(this).find("input[name=fecha_ingreso_exp]").val() == ""
          ? ""
          : $(this).find("input[name=fecha_ingreso_exp]").val(),
      fecha_retiro_exp:
        $(this).find("input[name=fecha_retiro_exp]").val() == ""
          ? ""
          : $(this).find("input[name=fecha_retiro_exp]").val(),
      funciones_exp:
        $(this).find("input[name=Funciones_exp]").val() == ""
          ? 0
          : $(this).find("input[name=Funciones_exp]").val(),
      id_experiencia:
        $(this).find("input[name=id_experiencia]").val() == ""
          ? 0
          : $(this).find("input[name=id_experiencia]").val(),
    };
    experiencia_ant.push(fila);
  });
  
 
$("#infoAcad_cont .infAcademica_anterior").each(function () {
  let fileInput = $(this).find("input[name='archivo_academico[]']")[0];

  let fila = {
    nivel_educativo: $(this).find("select[name='nivel_educativo[]']").val() || "",
    profesion: $(this).find("input[name='profesion[]']").val() || "",
    posgrado: $(this).find("input[name='posgrado[]']").val() || "",
    id_infoacademica: $(this).find("input[name='id_infoacademica[]']").val() || 0,
    archivo_academico: fileInput && fileInput.files.length > 0
      ? fileInput.files[0].name
      : ""
  };

  // Evitar objetos vacíos
  if (fila.nivel_educativo || fila.profesion || fila.posgrado || fila.id_infoacademica > 0) {
    infAcademica_ant.push(fila);
  }
});


  
  fecha_proceso = $("#fecha_proceso").val() == "" ? null : $("#fecha_proceso").val();
  data = new FormData();
  data.append("id_funcionario", $("#id_funcionario").val());
  data.append("tipo_documento", $("#tipo_documento").val());
  data.append("documento", $("#cedula").val());
  data.append("nombre", $("#nombres").val());
  data.append("apellido", $("#apellidos").val());
  data.append("pais_nacimiento", $("#pais_nacimiento").val()); //majjul
  data.append("ciudad_nacimiento", $("#ciudad_nacimiento").val()); //majjul
  data.append("otro_municipio", $("#otro_municipio").val()); //majjul  
  data.append("edad", $("#edad").val());
  data.append("email", $("#correo").val());
  data.append("celular", $("#telefono").val());
  data.append("direccion", $("#direccion").val());
  data.append("municipio", $("#municipio").val());
  data.append("fecha_nacimiento", $("#fecha_nac").val());
  data.append("genero", $("input[name=sexo]:checked").val());
  data.append("tipo_sanguineo", $("#tipo_sanguineo").val());
  data.append("etnia", $("#etnia").val());
  data.append("victima_violencia", $("#victima_violencia").val());
  data.append("madre_padre", $("#madre_padre").val());
  data.append("cabeza_familia", $("#is_cabezafamilia").val());
  data.append("condicion_medica", $("#condicion_medica").val());
  data.append("estado", $("#estado").val());
  data.append("is_actualizado", $("#is_Actualizado").val());
  //data.append("nivel_educativo", $("#nivel_educativo").val());
  //data.append("profesion", $("#profesion").val());
  //data.append("posgrado", $("#posgrado").val());
  data.append("tipo_vinculacion", $("#tipo_vinculacion").val());
  data.append("fecha_ingreso_nombra", $("#fecha_ingreso").val());
  data.append("ingreso", $("#ingreso").val());
  data.append("nivel_funcionario", $("#nivel_sel").val());
  data.append("cargo_propiedad", $("#cargo_propiedad").val());
  data.append("codigo", $("#codigo").val());
  data.append("dependencia", $("#dependencia").val());
  data.append("sede", $("#sede").val());
  data.append("grado", $("#grado").val());
  data.append("fecha_posesion", $("#fecha_posesion").val());
  data.append("num_posesion", $("#num_posesion").val());
  data.append("num_resolucion", $("#num_resolucion").val());
  data.append("fecha_resolucion", $("#fecha_resolucion").val());
  data.append("modo_trabajo", $("#modo_trabajo").val());
  data.append("archivo_lab", $("#archivo_lab")[0].files[0]);
  data.append("arch_lab", $("#arch_lab").val());
  data.append("archivo",$("#archivo")[0].files[0]);
  data.append("foto", $("#foto").val());
  data.append("is_viviendapropia", $("input[name=vivienda]:checked").val());
  data.append("estado_vivienda", $("#vivienda_estado").val());
  data.append("infoAcademicaEliminados", $("#infoAcademicaEliminados").val());
  data.append(
    "is_procesodisciplinario",
    $("input[name=procesos_disc]:checked").val()
  );
  data.append("numero_proceso_dis", $("#numero_proceso").val());
  data.append("fecha_proceso_dis", fecha_proceso==null?'':fecha_proceso);
  // data.append('paz_salvo', $('#paz_salvo')[0].files[0]);
  data.append("estado_civil", $("#estado_civil").val());
  data.append('parientes', JSON.stringify(parientes));
  data.append('experiencia_ant', JSON.stringify(experiencia_ant));
  data.append('infAcademica_ant', JSON.stringify(infAcademica_ant));

// Agregar los archivos de "archivo_academico[]"
$('input[name="archivo_academico[]"]').each(function (index, fileInput) {
    if (fileInput.files.length > 0) {
        // Si el input tiene archivo, lo agregamos con su índice
        data.append('archivo_academico[' + index + ']', fileInput.files[0]);
    } else {
        // Si el input está vacío, agregamos un valor vacío para mantener el índice
        data.append('archivo_academico[' + index + ']', "");
    }
});

  // $.post('set/hojavida/crear', {
  //     general: data
  //   })
  //   .done(function (data) {
  //     if (data.trim() !== '') {
  //       data = JSON.parse(data);
  //       if (data.error == undefined) {
  //         alertSucces(data.success)
  //       } else {
  //         alertError(btoa('Error al crear el funcionario'));
  //         console.log(atob(data.error))
  //         return
  //       }
  //     }
  $.ajax({
    type: "POST",
    url: "set/hojavida/crear",
    data: data,
    contentType: false,
    processData: false,
    success: function (data) {
      if (data.trim() !== "") {
        data = JSON.parse(data);
        if (data.error != undefined) {
          alertError(data.error);
          return;
        } else if (data.error_arc != undefined) {
          alertError(data.error_arc);
          return;
        } else {
          alertSucces(data.success);
          return;
        }
      }
    },
  }).always(function () {
    $("#btnMakeSaldoinicla")
      .html('<i class="fa fa-save"></i> GUARDAR')
      .prop("disabled", false)
      .parents("form:first")
      .removeClass("was-validated");
  });
}
const calcularEdad = (fechaNacimiento) => {
  const fechaActual = new Date();
  const anoActual = parseInt(fechaActual.getFullYear());
  const mesActual = parseInt(fechaActual.getMonth()) + 1;
  const diaActual = parseInt(fechaActual.getDate());

  // 2016-07-11
  const anoNacimiento = parseInt(String(fechaNacimiento).substring(0, 4));
  const mesNacimiento = parseInt(String(fechaNacimiento).substring(5, 7));
  const diaNacimiento = parseInt(String(fechaNacimiento).substring(8, 10));

  let edad = anoActual - anoNacimiento;
  if (mesActual < mesNacimiento) {
      edad--;
  } else if (mesActual === mesNacimiento) {
      if (diaActual < diaNacimiento) {
          edad--;
      }
  }
  return edad;
};


function readURL(input) {
  if (input.files && input.files[0]) { //Revisamos que el input tenga contenido
    var reader = new FileReader(); //Leemos el contenido
    
    reader.onload = function(e) { //Al cargar el contenido lo pasamos como atributo de la imagen de arriba
     // $('#blah').css({'display','block'});
	  $('#blah').attr('src', e.target.result);
	  $('#blah').attr("style", "display:block ; padding:3px ;background-color: #f5f5f5; width: 90px;height: 110px;border: 1px solid #999999;")
	  
    }
    
    reader.readAsDataURL(input.files[0]);
  }
}

$("#archivo").change(function() { //Cuando el input cambie (se cargue un nuevo archivo) se va a ejecutar de nuevo el cambio de imagen y se verá reflejado.
  readURL(this);
});



   
//majjul
$("#municipio").change(function () {
  if ($(this).val() == "50") {
    $("#otro_municipio").removeAttr("disabled");
    $("#otro_municipio").focus();
  } else {
      $("#otro_municipio").val("");
      $("#otro_municipio").attr("disabled", "disabled");
  }
});
//