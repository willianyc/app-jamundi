$(document).ready(function () {
    getFuncionarioAll();
    getConsecutivo("actividades_programadas")
    
    let fecha = new Date();  
    document.getElementById("fecha_inicio").value = fecha.toJSON().slice(0,10);
    document.getElementById("fecha_finalizacion").value = fecha.toJSON().slice(0,10);

    $(document).on("click", "#btnGuardar", function () {
      var frm = $(this).parents("form:first").addClass("was-validated");
      invalid = $(frm).find(".form-control:invalid").length;
      // Se continua al siguiente paso si el formulario no tiene datos invalidos
      if (invalid == 0) {
        $(this).html("Creando...").prop("disabled", true);
        guardarActividad();
      }
    });
    
    $(document).on("click", "input[name=selectedAll]", function () {
      if ($(this).is(":checked")) {
        $("input[name=selected]").prop("checked", true);
      } else {
        $("input[name=selected]").prop("checked", false);
      }
    });
    
    $(document).on("change", "#recursos", function () {
      if ($(this).val() == "FINANCIERO" || $(this).val() =="AMBOS") {
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
    
    $(document).on("click", "button[name=limpiarFiltros]", function () {
      $("#tbl_funcionarios thead input[type=text]").val("");
      getFuncionarioAll();
    });
    $(document).on("click", "#btnNuevo", function () {
      $("#identificacionActividad").val("").prop("disabled", false);
      $("#nombreActividad").val("").prop("disabled", false);
      $("#btnBuscar").prop("disabled", false);
      $("#tblFuncionariosAsignados tbody tr").remove();
      $("input[name=selectedAll]").prop("checked", false);
      $("input[name=selected]").prop("checked", false);
    });
    $(document).on("click", "button[name=mdlAceptar]", function () {
      $("#tblFuncionariosAsignados tbody tr").remove();
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
        var tr = `<tr>
          <input type="hidden" name="id_funcionario" value=${id_funcionario}>
          <td>${documento}</td>
          <td>${nombre}</td>
          <td>${apellidos}</td>
          <td>${direccion}</td>
          <td>${email}</td>
          <td>${codigo}</td>
          <td>${cargo}</td>
          <td>${sede}</td>
          </tr>`;
        $("#tblFuncionariosAsignados tbody").append(tr);
      });
    });
    $(document).on(
      "keypress",
      "#tbl_funcionarios thead input[type=text]",
      function (e) {
        var keycode = e.keyCode ? e.keyCode : e.which;
        if (keycode == "13") {
          getFuncionarioAllFilter();
        }
      }
    );
  });
  
  function guardarActividad() {
    data = {
      nombre: $("#nombre").val(),
      identificacion: $("#identificacion").val(),
      fecha_inicio: $("#fecha_inicio").val(),
      fecha_finalizacion: $("#fecha_finalizacion").val(),
      modalidad: $("#modalidad").val(),
      direccion: $("#direccion").val(),
      recursos: $("#recursos").val(),
      entidad: $("#entidad").val(),
      ciclo: $("#ciclo").val(),
      valorTotal: $("#valorTotal").val(),
      archivo: $("#archivo").val(),
      consecutivo: $("#identificacion").attr("consecutivo"),
    };

    //console.log(Object.keys(data));
    //console.log(Object.values(data));

    
    $.post("set/actividadesProgramadas/crear", {
      general: JSON.stringify(data),
    })
      .done(function (data) {
        console.log(data);
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
      })
      .always(function () {
        $("#btnGuardar")
          .html('<i class="fa fa-save"></i> GUARDAR')
          .prop("disabled", false)
          .parents("form:first")
          .removeClass("was-validated");
         $("#btnGuardar").hide(); 
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
            tr += `<tr>
                <th scope="row"><input type="checkbox" name="selected"></th>
                <input type="hidden" name="id_funcionario" value='"${this.id_funcionario}"'>
                <input type="hidden" name="nombres" value="${this.nombre}">
                <input type="hidden" name="apellidos" value="${this.apellidos}">
                <input type="hidden" name="direccion" value="${this.direccion}">
                <input type="hidden" name="email" value="${this.email}">
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
  
  function getFuncionarioAllFilter() {
    $.post("ajaxGeneral.php?mode=funcionariosAllFilter", {
      documento: $("#documento").val(),
      tipo_vinculacion: $("#tipo_vinculacion").val(),
      cargo: $("#cargo").val(),
      nivel: $("#nivel").val(),
    }).done(function (data) {
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
            <input type="hidden" name="nombres" value="${this.nombre}">
            <input type="hidden" name="codigo" value="${this.codigo}">
            <input type="hidden" name="sede" value="${this.sede}">
            <input type="hidden" name="apellidos" value="${this.apellidos}">
            <input type="hidden" name="direccion" value="${this.direccion}">
            <input type="hidden" name="email" value="${this.email}">
            <td name="documento">${this.documento}</td>
            <td name="tipo_vinculacion">${this.tipo_vinculacion}</td>
            <td name="nivel">${this.nivel}</td>
            <td name="cargo">${this.cargo}</td>
            </tr>`;
        });
        $("#tbl_funcionarios tbody").html(tr);
      }
    });
  }
  //