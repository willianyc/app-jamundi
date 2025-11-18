var objMsjAJX = null;
var objSeccionValidacion = {
  general: {
    seccionID: 'general',
    seccionText: 'Crear usuario',
    secciionTrigger: null,
  },
  general_cargo: {
    seccionID: 'general_cargo',
    seccionText: 'CREAR CARGO',
    secciionTrigger: null,
  }
}
$(document).ready(function () {

  Selectsucursal();
  selectTercero();
  selectPerfil();
  selectCargo();
  UsuariosCreados()
  $("#crearusaurio").click(function () {
    usuario = $("#usuario").val()
    is_update = 0
    $("#usuarios tbody tr").each(function () {
      nombre = $(this).find("label[for=usuario]").text()
      if (usuario == nombre) {
        is_update = 1
      }
    })
    console.log(is_update)
    if (is_update == 1) {
      modificarUsuario();
    } else {
      crearUsuario();
    }
  })
  $("#crearcargo").click(function () {
    crearCargo();
    selectCargo();
  })
  $("#id_empleadocargo").change(function () {
    $.post('get/generics/cargoperfil', {
        id_empleado: $("#id_empleadocargo").val()
      })
      .done(function (data) {
        if (data.trim() !== '') {
          data = JSON.parse(data);
          if (data.error != undefined) {
            // objMsjAJX.showError(data.error)
            return
          }
          if (data != "") {
            $("#id_perfil").val(data[0].id_perfil);
          }
        }
      })
  })
})

function UsuariosCreados() {
  $.post('get/generics/usuarios')
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          // objMsjAJX.showError(data.error)
          return
        }
        usuarios = ''
        // cont = 0
        $(data).each(function () {
          if (this.is_activo == 1) {
            is_activo = "Si"
          } else {
            is_activo = "No"
          }
          if (this.cargo == null) {
            this.cargo = ""
          } else {
            this.cargo = this.cargo
          }
          // cont++
          usuario = this.usuario.slice(0, -5)
          // console.log(user)
          usuarios += "<tr style='font-size: 12px;'><td><label for='no'>" + this.no + "</label></td>" +
            "<td><label for='usuario'>" + usuario + "</label></td>" +
            "<input type='hidden' name='id_sucursal' value=" + this.id_sucursal + ">" +
            "<input type='hidden' name='is_activo' value=" + this.is_activo + ">" +
            "<td><label for='cargo'>" + this.cargo + "</label></td>" +
            "<td><label for='sucursal'>" + this.sucursal + "</label></td>" +
            "<td><label for='is_activo'>" + is_activo + "</label></td>" +
            "</tr>";
        })
        $('#usuarios tbody').html(usuarios)
      }
    })

}

function Selectsucursal() {
  $.post('get/generics/sucursal')
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          // objMsjAJX.showError(data.error)
          return
        }
        options = '<option value="" selected>Seleccione la sucursal...</option>'
        $(data).each(function () {
          options += '<option value="' + this.id_sucursal + '">' + this.sucursal + '</option>'
        })
        $('#sucursal').html(options)
      }
    })

}

function selectCargo() {
  var idperfil;
  $.post('get/generics/cargoempleados')
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          // objMsjAJX.showError(data.error)
          return
        }
        options = ''
        optionbtn = ''
        $(data).each(function () {
          options += '<option value="' + this.id_empleado + '" cargo="' + this.cargo + '">' + this.tercero + '</option>'
          optionbtn = "<option style='background-color: #18ce0f; color:#FFFFFF'><a class='btn-save btn btn-primary btn-sm' data-toggle='modal' data-target='#CrearComprobante'>Crear cargo</a></option>"
          idperfil = this.id_perfil;
        })

        $('#id_empleadocargo optgroup[label=Cargos]').html(options)
        $('#id_empleadocargo optgroup[crear_cargo=1]').html(optionbtn)
        $('#id_empleadocargo').selectpicker('refresh')
        $("#id_empleadocargo").val("")
        $('li.dropdown-header').css({
          "padding-top": "0px",
          "padding-bottom": "0px"
        });
        $('button.dropdown-toggle ').css({
          "margin": "0px",
          "padding": "7px"
        });
        $("div.dropdown").css("width", "150%")
        $('div.filter-option-inner-inner').text("Seleccione la el cargo")
      }
    })
}

$(document).on("change", "#id_empleadocargo", function (e) {
  option = $(this).val()
  if (option == "Crear cargo") {
    $("#CrearComprobante").modal()
    // $('#new_cargo').selectpicker('refresh')
    // $('div.filter-option-inner-inner').text("Seleccione la el cargo")
  }
})

$(document).on('dblclick', '#usuarios tbody tr', function (e) {
  $("#mdl_usuarios").modal("hide")
  usuario = $(this).find("label[for=usuario]").text()
  cargo = $(this).find("label[for=cargo]").text()
  id_sucursal = $(this).find("input[name=id_sucursal]").val()
  is_activo = $(this).find("input[name=is_activo]").val()
  $("#usuario").prop("disabled", true)
  $("#usuario").val(usuario)
  $("#sucursal option[value=" + id_sucursal + "]").prop("selected", true)
  $("#is_activo option[value=" + is_activo + "]").prop("selected", true)
  $("#div_mycontraseña").css("display", "block")
  if (cargo != "") {
    $("#id_empleadocargo option[cargo='" + cargo + "']").prop("selected", true)
    $("#id_empleadocargo").prop("disabled", true)
    $('#id_empleadocargo').selectpicker('refresh')
    $('li.dropdown-header').css({
      "padding-top": "0px",
      "padding-bottom": "0px"
    });
    $('button.dropdown-toggle ').css({
      "margin": "0px",
      "padding": "7px"
    });
    $("div.dropdown").css("width", "87%")
  } else {
    $("#id_empleadocargo").val("")
    $('div.filter-option-inner-inner').text("Seleccione la el cargo")
  }
})

function selectTercero() {

  $.post('get/generics/terceroperfil')
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          // objMsjAJX.showError(data.error)
          console.log(data);
          return
        }
        options = '<option value="" selected>Seleccione el empleado...</option>'
        $(data).each(function () {
          options += '<option value="' + this.id_tercero + '">' + this.tercero + '</option>'
        })
        $('#id_empleado').html(options)
      }
    })
}

function selectPerfil() {

  $.post('get/generics/perfil')
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        if (data.error != undefined) {
          // objMsjAJX.showError(data.error)
          return
        }
        options = '<option value="" selected>Seleccione el perfil...</option>'
        $(data).each(function () {
          options += '<option value="' + this.id_perfil + '">' + this.perfil + '</option>'
        })
        $('#idperfil').html(options)
      }
    })
}

function crearUsuario() {
  objMsjAJX = new MsjAJX()
  objMsjAJX.setSeccionesValidacion(objSeccionValidacion)
  $.post('set/usuarios/crear', {
      general: JSON.stringify({
        action: true,
        usuario: $.getDataBindToAjax($('#usuario').setUIDElement().val()),
        id_empleadocargo: $.getDataBindToAjax($('#id_empleadocargo').setUIDElement().val()),
        id_perfil: $.getDataBindToAjax($("#id_perfil").setUIDElement().val()),
        sucursal: $.getDataBindToAjax($("#sucursal").setUIDElement().val()),
        password: $.getDataBindToAjax($("#password").setUIDElement().val()),
        is_activo: $.getDataBindToAjax($("#is_activo").setUIDElement().val()),
      })
    })
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        objMsjAJX.sel['msj'] = "#MsjAJX";
        if (data.error != undefined) {
          objMsjAJX.showError(data.error)
          return
        }
        if (data.success != undefined) {
          objMsjAJX.showSuccess(data.success)
          UsuariosCreados()
        }
      }
    })
}

function modificarUsuario() {
  objMsjAJX = new MsjAJX()
  objMsjAJX.setSeccionesValidacion(objSeccionValidacion)
  $.post('set/usuarios/modificar', {
      general: JSON.stringify({
        action: true,
        usuario: $.getDataBindToAjax($('#usuario').setUIDElement().val()),
        my_password: $.getDataBindToAjax($('#my_password').setUIDElement().val()),
        // id_perfil: $.getDataBindToAjax($("#id_perfil").setUIDElement().val()),
        sucursal: $.getDataBindToAjax($("#sucursal").setUIDElement().val()),
        password: $.getDataBindToAjax($("#password").setUIDElement().val()),
        is_activo: $.getDataBindToAjax($("#is_activo").setUIDElement().val()),
      })
    })
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        objMsjAJX.sel['msj'] = "#MsjAJX";
        if (data.error != undefined) {
          objMsjAJX.showError(data.error)
          return
        }
        if (data.success != undefined) {
          objMsjAJX.showSuccess(data.success)
          UsuariosCreados()
        }
      }
    })
}

function crearCargo() {
  objMsjAJX = new MsjAJX()
  objMsjAJX.setSeccionesValidacion(objSeccionValidacion)
  $.post('set/cargo/crear', {
      general_cargo: JSON.stringify({
        action: true,
        id_empleado: $.getDataBindToAjax($('#id_empleado').setUIDElement().val()),
        cargo: $.getDataBindToAjax($("#cargo").setUIDElement().val()),
        idperfil: $.getDataBindToAjax($("#idperfil").setUIDElement().val()),
      })
    })
    .done(function (data) {
      if (data.trim() !== '') {
        data = JSON.parse(data);
        objMsjAJX.sel['msj'] = "#MsjAJXCarg";
        if (data.error != undefined) {
          objMsjAJX.showError(data.error)
          return
        }
        if (data.success != undefined) {
          objMsjAJX.showSuccess(data.success)
          selectCargo()
        }
      }
    })

}//