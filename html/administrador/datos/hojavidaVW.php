<?php

?>
<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->

<!-- <div class="container-fluid container_view"> -->

<style>
  /* Todas las pestañas (estado normal) */
  #hojaVidaTabs .nav-link {
    font-size: 9px;               /* Letra más pequeña */
    padding: 0.3rem 0.6rem;        /* Menos espacio */
    background-color: #f8f9fa;     /* Gris claro */
    color: #495057;                /* Texto gris oscuro */
    border: 1px solid #dee2e6;     /* Borde fino */
    border-radius: 5px 5px 0 0;    /* Bordes superiores redondeados */
    margin-right: 3px;             /* Espacio pequeño entre pestañas */
  }

  /* Pestaña activa */
  #hojaVidaTabs .nav-link.active {
    background-color: #0d6efd;  /* Azul Bootstrap */
    color: white;               /* Texto blanco */
    border-color: #0d6efd;      /* Borde igual al fondo */
  }

  /* Hover (cuando pasas el mouse por encima) */
  #hojaVidaTabs .nav-link:hover {
    background-color: #e2e6ea;  /* Gris un poco más oscuro */
    color: #212529;             /* Texto más oscuro */
  }
</style>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h5 class="mb-0">Gestión Hoja de Vida</h5>
  <button type="button" class="btn btn-secondary btn-sm" onclick="window.history.back();">
    <i class="fa fa-arrow-left"></i> Regresar
  </button>
</div>


    <form action="" class="mb-3" enctype="multipart/form-data">

  <!-- Nav Tabs -->
  <ul class="nav nav-tabs" id="hojaVidaTabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active fw-bold" id="funcionario-tab" data-bs-toggle="tab" data-bs-target="#funcionario" type="button" role="tab">INFORMACIÓN FUNCIONARIO</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="academica-tab" data-bs-toggle="tab" data-bs-target="#academica" type="button" role="tab">INFORMACIÓN ACADÈMICA</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="familiar-tab" data-bs-toggle="tab" data-bs-target="#familiar" type="button" role="tab">INFORMACIÓN FAMILIAR</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="experiencialab-tab" data-bs-toggle="tab" data-bs-target="#experiencialab" type="button" role="tab">INFORMACIÓN LABORAL</button>
    </li>
	<li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="seguridadsoc-tab" data-bs-toggle="tab" data-bs-target="#seguridadsoc" type="button" role="tab">SEGURIDAD SOCIAL</button>
    </li>
	<li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="incapacidad-tab" data-bs-toggle="tab" data-bs-target="#incapacidad" type="button" role="tab">INCAPACIDAD</button>
    </li>
	<li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="caractvivi-tab" data-bs-toggle="tab" data-bs-target="#caractvivi" type="button" role="tab">CARACTERISTICAS DE LA VIVIENDA</button>
    </li>
	<li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="procdicp-tab" data-bs-toggle="tab" data-bs-target="#procdicp" type="button" role="tab">PROCESOS DISCIPLINARIO</button>
    </li>
	
	<li class="nav-item" role="presentation">
      <button class="nav-link  fw-bold" id="expprev-tab" data-bs-toggle="tab" data-bs-target="#expprev" type="button" role="tab">EXPERIENCIA PREVIA</button>
    </li>
	
  </ul>

  <!-- Contenido de las pestañas -->
  <div class="tab-content mt-3" id="hojaVidaTabsContent">

    <!-- Información Funcionario -->
    <div class="tab-pane fade show active" id="funcionario" role="tabpanel">
      <div class="secciones">

        <div class="row padding-secciones" id="info_funcionario">
          <input type="hidden" id="id_funcionario" value="">

        
	<!-- foto --->	 
		 <div class="col-md-6 mb-2">
            <!-- <input type="file" accept="image/*" name="archivo" id="archivo"/>     -->
			 <label class="label-form" for="modo_trabajo">Seleccione Foto del Funcionario</label>
             <input type="file" class="form-control input-form color-t border-required desactivar" id="archivo" name="archivo " accept="image/*">
			 <input type="hidden" id="foto" name="foto">
            
         </div>		
		 <div class="col-md-6 mb-2">
            <img class="label-form" id="blah" name="blah" src="#" 
             style=" padding:10px ; display:none;
             background-color: #f5f5f5;
             width: 80px;
             height: 100px;
             border: 1px solid #999999;"/> 
         </div>		 
		 
		 
	<!---->	 
		 

          <div class="col-md-3 mb-2">
            <label class="label-form" for="tipo_documento">Tipo de documento</label>
            <!--<input type="text" class="form-control input-form color-t border-required" id="tipo_documento" name="cedula" value="Cedula de Ciudadania" maxlength="255" readonly disabled> -->
             <select class="form-control input-form color-t border-required desactivar" id="tipo_documento" >
              <option value="" selected disabled>Seleccione...</option>
            </select>

            <div class="invalid-feedback">
              Debe seleccionar el Tipo de documento
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="cedula">N° Identificación <span style="color: red;">*</span></label>
            <input type="number" class="form-control input-form color-t border-required desactivar" id="cedula" name="cedula" placeholder="N° Identificación..." maxlength="255" value="" >
            <div class="invalid-feedback">
              Debe Digitar la identificacion
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="nombres">Nombres <span style="color: red;">*</span></label>
            <input type="text" class="form-control input-form color-t border-required desactivar" id="nombres" name="nombres_primer" placeholder="Nombres completos..." maxlength="255" value="" >
            <div class="invalid-feedback">
              Debe escribir el Nombres
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="apellidos">Apellidos <span style="color: red;">*</span></label>
            <input type="text" class="form-control input-form color-t border-required desactivar" id="apellidos" name="apellido_primer" placeholder="Apellidos completos..." maxlength="255" value="" >
            <div class="invalid-feedback">
              Debe escribir el Apellidos
            </div>
          </div>

<!--
          <div class="col-md-3 mb-2">
            <label class="label-form" for="paisNaci">Pais de Nacimiento <span style="color: red;"></span></label>
            <input type="text" class="form-control input-form color-t border-required desactivar" id="pais_nacimiento" name="pais_nacimiento" placeholder="Nombre Pais..." maxlength="255" value="">
            <div class="invalid-feedback">Debe digitar el nombre del pais</div>
          </div>
-->

          <div class="col-md-3 mb-2">
          <label class="label-form">País de nacimiento</label>
          <select id="pais_nacimiento" name="pais_nacimiento" class="form-control input-form color-t border-required desactivar" required></select>
          </div>

          <div class="col-md-3 mb-2">
            <label class="label-form" for="ciudadNaci">Ciudad Nacimiento <span style="color: red;"></span></label>
            <input type="text" class="form-control input-form color-t border-required desactivar" id="ciudad_nacimiento" name="ciudad_nacimiento" placeholder="Nombre Ciudad..." maxlength="255" value="">
            <div class="invalid-feedback">Debe digitar el nombre de la  ciudad</div>
          </div>   
          

          
          <div class="col-md-3">
            <label for="fecha_nac" class="label-form">Fecha de nacimiento <span style="color: red;">*</span></label>
            <input type="date" class="form-control input-form color-t disabled desactivar border-required" id="fecha_nac" >
            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="edad">Edad</label>
            <input type="text" class="form-control input-form color-t border-required" id="edad" name="edad" placeholder="Edad..." disabled maxlength="255" value="" >
            <div class="invalid-feedback">
              Debe escribir la Edad
            </div>
          </div>


          <div class="col-md-3">
    <label class="label-form">Género <span style="color: red;">*</span></label>
    <select id="sexo" name="sexo" class="form-control input-form color-t border-required desactivar" required>
        <option value="">Seleccione...</option>
        <option value="M">Hombre</option>
        <option value="F">Mujer</option>
        <option value="O">No Binario</option>
    </select>
    <div class="invalid-feedback">Debe seleccionar el género</div>
</div>



          <div class="col-md-3 mb-2">
            <label class="label-form" for="estado_civil">Estado civil <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="estado_civil" >
              <option value="" selected disabled>Seleccione...</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar este campo
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="tipo_sanguineo">Tipo de sangre <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="tipo_sanguineo" placeholder='Tipo de sangre...' >
              <option value="" selected disabled>Seleccione...</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar el Tipo de sangre
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="etnia">Étnia <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="etnia" placeholder='ARL...' >
              <option value="" selected disabled>Seleccione...</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar la etnia
            </div>
          </div>          

          <div class="col-md-3 mb-2">
            <label class="label-form" for="victima_violencia"> REGISTRO ÚNICO DE VÍCTIMAS (RUV) <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="victima_violencia" placeholder='ARL...' >
              <option value="" selected disabled>Seleccione...</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar el si es victima
            </div>
          </div>



          <div class="col-md-4 mb-2">
              <label class="label-form" for="id_condicion_vulnerabilidad">Condición de Vulnerabilidad</label>
              <select class="form-control input-form color-t border-required desactivar" id="condicion_vulnerabilidad" name="condicion_vulnerabilidad" >
              </select>
              <div class="invalid-feedback">Este campo es requerido</div>
          </div>





          <div class="col-md-3 mb-2">
            <label class="label-form" for="madre_padre">¿Madre o padre? <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="madre_padre" placeholder='ARL...' >
              <option value="" selected disabled>Seleccione...</option>
              <option value="MADRE">MADRE</option>
              <option value="PADRE">PADRE</option>
              <option value="NO">NO TIENE HIJOS</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar este campo
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="is_cabezafamilia">¿Es cabeza de familia? <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="is_cabezafamilia" placeholder='ARL...' >
              <option value="" selected disabled>Seleccione...</option>
              <option value="1">SI</option>
              <option value="0">NO</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar este campo
            </div>
          </div>


          <div class="col-md-3 mb-2">
    <label class="label-form" for="condicion_medica">PATOLOGÍAS PRESENTE <span style="color:red">*</span></label>
    <select class="form-control input-form color-t border-required desactivar" 
            id="condicion_medica" name="condicion_medica" required>
        <option value="">Seleccione...</option>
        <option value="HIPERTENSIÓN ARTERIAL">HIPERTENSIÓN ARTERIAL (Presión alta)</option>
        <option value="DIABETES">DIABETES (Azúcar en la sangre)</option>
        <option value="ENFERMEDAD CARDIACA">ENFERMEDAD CARDIACA (Arritmia, infarto, etc.)</option>
        <option value="ENFERMEDAD RESPIRATORIA">ENFERMEDAD RESPIRATORIA (Asma, EPOC, bronquitis, etc.)</option>
        <option value="ENFERMEDAD RENAL">ENFERMEDAD RENAL (Insuficiencia, diálisis, cálculos, etc.)</option>
        <option value="ENFERMEDAD MENTAL">ENFERMEDAD MENTAL (Ansiedad, depresión, etc.)</option>
        <option value="ALERGIAS">ALERGIAS (Medicamentos, alimentos, etc.)</option>
        <option value="TRASTORNOS NEUROLOGICOS">TRASTORNOS NEUROLÓGICOS (Epilepsia, etc.)</option>
        <option value="ENFERMEDAD HEMATOLOGICA">ENFERMEDAD HEMATOLÓGICA (Coagulación, hemofilia, etc.)</option>
        <option value="TRASTORNOS MUSCULO ESQUELETICOS">TRASTORNOS MÚSCULO-ESQUELÉTICOS (Lumbalgias, tendinitis, etc.)</option>
        <option value="NINGUNA">NINGUNA DE LAS ANTERIORES</option>
        <option value="OTROS">OTROS</option>
    </select>
    <div class="invalid-feedback">Este campo es requerido</div>
</div>

<!-- Campo oculto para descripción -->
<div class="col-md-4 mb-2 d-none" id="desc_condicion_group">
    <label class="label-form" for="desc_condicion_medica">Descripción de la Patología</label>
    <input type="text" 
           id="desc_condicion_medica" 
           name="desc_condicion_medica"
           maxlength="255"
           class="form-control input-form color-t border-required desactivar"
           placeholder="Describa la condición médica...">
</div>

<div class="col-md-3 mb-2">
    <label class="label-form" for="estado_gestacion">¿Se encuentra en estado de gestación?</label>
    <select class="form-control input-form color-t border-required desactivar" 
            id="estado_gestacion" 
            name="estado_gestacion" 
            required>
        <option value="">Seleccione...</option>
        <option value="SI">SI</option>
        <option value="NO">NO</option>
    </select>
    <div class="invalid-feedback">
        Este campo es requerido.
    </div>
</div>



<!-- DISCAPACIDAD -->
<div class="col-md-3 mb-2">
    <label class="label-form" for="discapacidad">¿Presenta alguna discapacidad?</label>
    <select class="form-control input-form color-t border-required desactivar"
            id="discapacidad"
            name="discapacidad"
            required>
        <option value="">Seleccione...</option>
        <option value="SI">SI</option>
        <option value="NO">NO</option>
    </select>
    <div class="invalid-feedback">Este campo es requerido.</div>
</div>

<!-- TIPO DE DISCAPACIDAD -->
<div class="col-md-4 mb-2 d-none" id="tipo_discapacidad_group">
    <label class="label-form" for="tipo_discapacidad">Tipo de Discapacidad</label>
    <input type="text"
           id="tipo_discapacidad"
           name="tipo_discapacidad"
           maxlength="255"
           class="form-control input-form color-t border-required desactivar"
           placeholder="Describa el tipo de discapacidad...">
</div>

<!-- CERTIFICADO DE DISCAPACIDAD -->
<div class="col-md-3 mb-2 d-none" id="certificado_discapacidad_group">
    <label class="label-form" for="certificado_discapacidad">¿Cuenta con certificado de discapacidad?</label>
    <select class="form-control input-form color-t border-required desactivar"
            id="certificado_discapacidad"
            name="certificado_discapacidad">
        <option value="">Seleccione...</option>
        <option value="SI">SI</option>
        <option value="NO">NO</option>
    </select>
</div>

<div class="col-md-3 mb-2">
    <label class="label-form" for="organizacion_sindical">Organización Sindical</label>
    <select id="organizacion_sindical" name="organizacion_sindical" class="form-control input-form color-t border-required desactivar">
    </select>
    <div class="invalid-feedback">Debe seleccionar una organización sindical.</div>
</div>

<div class="col-md-3 mb-2">
    <label class="label-form" for="derecho_car_admin">
        ¿Derechos de Carrera Administrativa en otra entidad?
    </label>
    <select id="derecho_car_admin" name="derecho_car_admin" class="form-control desactivar" required>
        <option value="">Seleccione...</option>
        <option value="SI">SI</option>
        <option value="NO">NO</option>
    </select>
    <div class="invalid-feedback">Debe seleccionar una opción</div>
</div>





          <div class="col-md-3 mb-2">
            <label class="label-form" for="correo">Correo <span style="color: red;">*</span></label>
            <input type="email" class="form-control input-form color-t border-required desactivar" id="correo" name="correo" placeholder="Correo electronico..." maxlength="255" value="" >
            <div class="invalid-feedback">
              Debe escribir el correo
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="telefono">Celular <span style="color: red;">*</span></label>
            <input type="number" class="form-control input-form color-t border-required desactivar" id="telefono" name="telefono" placeholder="Celular..." maxlength="255" value="" >
            <div class="invalid-feedback">
              Debe digitar el Celular
            </div>
          </div>
          
          <div class="col-md-3 mb-2">
            <label class="label-form" for="municipio">Municipio <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="municipio" placeholder='municipio...' >
              <option value="" selected disabled>Seleccione...</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar el Municipio
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="otroMunicipio">Otro Municipio <span style="color: red;"></span></label>
            <input type="text" class="form-control input-form color-t border-required desactivar" id="otro_municipio" name="otro_municipio" placeholder="Nombre Municipio..." maxlength="255" value="" disabled>
          </div>
          
          
          <div class="col-md-6 mb-2">
            <label class="label-form" for="direccion">Dirección <span style="color: red;">*</span></label>
            <input type="text" class="form-control input-form color-t border-required desactivar" id="direccion" name="direccion" placeholder="Dirección de residencia..." maxlength="255" value="" >
            <div class="invalid-feedback">
              Debe escribir la dirección
            </div>
          </div>

          <div class="col-md-6 mb-2">
            <label class="label-form" for="barrio">Barrio <span style="color: red;"></span></label>
            <input type="text" class="form-control input-form color-t border-required desactivar" id="barrio" name="barrio" placeholder="barrio..." maxlength="200" value="" >
          </div>

          
          <div class="col-md-3 mb-2">
            <label class="label-form" for="estado">Estado</label>
            <select class="form-control input-form color-t border-required desactivar" id="estado" disabled >
              <option value="1" select>ACTIVO</option>
              <option value="0">RETIRADO</option>
            </select>
            <div class="invalid-feedback">
              Debe seleccionar el estadao
            </div>
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="is_Actualizado">¿Actualizado? <span style="color: red;">*</span></label>
            <select class="form-control input-form color-t border-required desactivar" id="is_Actualizado" placeholder='ARL...' >
              <option value="" selected disabled>Seleccione...</option>
              <option value="1">SI</option>
              <option value="0">NO</option>
            </select>
            <div class="invalid-feedback">
              este campo es requerido
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Información Académica -->
    <div class="tab-pane fade" id="academica" role="tabpanel">
      <div class="col-md-12 mb-3 d-none" id="info_academica">
        <h6 class="submenus">INFORMACIÓN ACADEMICA</h6>
        
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="col-md-2 p-0 m-2 mb-0">
            <button class="btn btn-success btn-sm btn-pdd desactivar" id="BtnAddInfAcad" name="BtnMdllCrearcaja" data-toggle="modal" data-target="#crearcaja">
              <i class="fa fa-plus-circle"></i></button>
          </div>
          <div id="infoAcad_cont" class="row padding-secciones">
            <div class="row padding-secciones infAcademica_anterior">
              <div class="row">
                <div class="col-md-3 mb-3">
                  <input type="hidden" id="infoAcademicaEliminados" name="infoAcademicaEliminados">
                  <!--<button class="btn btn-danger btn-sm desactivar" name="btnEliminarInfAcad" style="float:left" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR a1</button>-->
                </div>
              </div>
              <div class="row padding-secciones">
            
              </div>
            </div>
          </div>




        </div>






      </div>
    </div>

    <!-- Información Familiar -->
    <div class="tab-pane fade" id="familiar" role="tabpanel">
      <div class="col-md-12 mb-3 d-none" id="nu_fam">
        <h6 class="submenus">NÚCLEO FAMILIAR</h6>
        <input type="hidden" id="id_tercero">
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones">
            <div class="col-md-2 p-0">
              <button class="btn btn-success btn-sm btn-pdd desactivar" id="BtnAddDetalle" name="BtnMdlCrearcaja" data-toggle="modal" data-target="#crearcaja"><i class="fa fa-plus-circle"></i></button>
            </div>
            <table id="tblNucleoFamiliar">
              <thead>
                <tr class="sub-titletable">
                  <td class="">N°</td>
                  <td class="" style="width: 169px;">Nombres<span style="color: red;">*</span></td>
                  <td class="" style="width: 169px;">Apellidos<span style="color: red;">*</span></td>
                  <td style="width:140px">Parentesco<span style="color: red;">*</span></td>
                  <!--<td class="" style="width:140px">Descripción<span style="color: red;">*</span></td>-->
                  <td style="width:120px">Fecha de nacimiento</td>
                  <td style="width:125px">Edad</td>
                  <td style="width:120px">Contacto de emergencia</td>
                  <td style="" style="width: 300px;">Numero de contacto</td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <tr class="nucleo_familia">
                  <td class="td-table d-none"><input type="hidden" name="id_familia"></td>
                  <td class="td-table" style="text-align: center;"><label for="numero">1</label></td>
                  <td class="td-table"><input type="text" required class="form-control input-table desactivar" name="nombre" placeholder="Nombres..."></td>
                  <td class="td-table"><input type="text" required class="form-control input-table desactivar" name="apellido" placeholder="Apellidos..."></td>
                  <td class="td-table">
                    <select class="form-control input-table parentesco desactivar" required name="parentesco" placeholder='Parentesco...'>
                      <option value="" selected disabled>Seleccione...</option>
                    </select>
                  </td>
                  <td class="td-table"><input type="text" required class="form-control input-table" name="parentesco_otro" disabled placeholder="Parentesco..."></td>
                  <td>
                    <input type="date" class="form-control input-table desactivar" name="fecha_nacimiento">
                  </td>
                  <td class="td-table"><input type="text" disabled class="form-control input-table" name="edad" placeholder="Edad..."></td>
                  <td class="td-table" style="text-align: center;">
                    <input type="checkbox" style="width: 21px;height: 21px;" name="emegencia" class="form-check-input emergencia_check desactivar">
                  </td>
                  <td class="td-table d-flex" style="text-align: center;">
                    <input type="text" class="form-control input-table d-none contacto_emergencia desactivar" name="contacto_emergencia" placeholder="Contacto Emergencia...">
                    <input type="text" class="form-control input-table d-none contacto_emergencia desactivar" name="contacto_emergencia_2" placeholder="Contacto 2 Emergencia ..." style="margin-left: 1px;">
                  </td>
                  <td>
                    <button class="btn btn-danger btn-sm desactivar" name="eliminarDetalle"><i class="fa fa-trash-o"></i></button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- INFORMACIÓN LABORAL -->
    <div class="tab-pane fade" id="experiencialab" role="tabpanel">
       <div class="col-md-12 mb-3 d-none" id="info_lab">
        <h6 class="submenus">INFORMACIÓN LABORAL</h6>
        <input type="hidden" id="id_tercero">
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones">
            <div class="col-md-3 mb-2">
              <label class="label-form" for="tipo_vinculacion">Tipo de vinculación <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="tipo_vinculacion" placeholder='' >
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Tipo de vinculación
              </div>
            </div>
            <div class="col-md-3">
              <label for="fecha_ingreso" class="label-form">Fecha de ingreso <span style="color: red;">*</span></label>
              <input type="date" class="form-control input-form color-t disabled desactivar border-required" id="fecha_ingreso" >
              <div class="invalid-feedback">Debe seleccionar la fecha.</div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="ingreso">Año de ingreso <span style="color: red;">*</span></label>
              <input type="text" class="form-control input-form color-t border-required desactivar" disabled id="ingreso" name="ingreso" id="year_ingreso" placeholder="Año de ingreso..." maxlength="255" value="" >
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="nivel_select">Nivel <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="nivel_sel" placeholder='Nivel educativo...' >
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Nivel
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="cargo_propiedad">Denominación del empleo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="cargo_propiedad" placeholder='Cargo en propiedad educativo...' >
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Cargo en propiedad
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="codigo">Código <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="codigo" placeholder='Cargo...' >
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Codigo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="grado">Grado <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="grado" placeholder='Cargo...' >
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el grado
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="dependencia">Dependencia <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="dependencia" placeholder='Cargo...' >
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Dependencia
              </div>
            </div>
            
            <div class="col-md-3 mb-2">
              <label class="label-form" for="num_posesion">N° de acto administrativo <span style="color: red;">*</span></label>
              <input type="text" class="form-control input-form color-t border-required desactivar" id="num_posesion" name="num_posesion" placeholder="Posesión..." max="99999999999" value="" >
              <div class="invalid-feedback">
                Este campo es obligatorio
              </div>
            </div>
			  <div class="col-md-3 mb-2">
              <label class="label-form" for="fecha_resolucion">Fecha Exp. Resolución <span style="color: red;">*</span></label>
              <input type="date" class="form-control input-form color-t border-required desactivar" id="fecha_resolucion" name="fecha_resolucion" maxlength="255" value="">
              <div class="invalid-feedback">
                Este campo es obligatorio
              </div>
            </div>
            
            <div class="col-md-3 mb-2">
              <label class="label-form" for="num_resolucion">N° Acta de Posesión <span style="color: red;">*</span></label>
              <input type="text" maxlength="12"  class="form-control input-form color-t border-required desactivar" id="num_resolucion" name="num_resolucion" placeholder="Resolución..." max="99999999999" value="" >
              <div class="invalid-feedback">
                Este campo es obligatorio
              </div>
            </div>
          <div class="col-md-3 mb-2">
              <label class="label-form" for="fecha_posesion">Fecha de Posesión <span style="color: red;">*</span></label>
              <input type="date" class="form-control input-form color-t border-required desactivar" id="fecha_posesion" name="fecha_posesion" placeholder="Ingrese el Cargo..." maxlength="20" value="" >
              <div class="invalid-feedback">
                Este campo es obligatorio
              </div>
            </div>
			<div class="col-md-3 mb-2">
              <label class="label-form" for="sede">Sede <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="sede" placeholder='Cargo...' >
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar el Sede
              </div>
            </div>
            <div class="col-md-9 mb-2 row">
              <div class="col-md-4">
                <label class="label-form" for="exp_previa">Experiencia Previa</label>
                <input type="text" class="form-control input-form color-t border-required" id="exp_previa" value="0" name="exp_previa" maxlength="255" disabled>
              </div>
              <div class="col-md-4">
                <label class="label-form" for="exp_institucional">Experiencia Institucional</label>
                <input type="text" class="form-control input-form color-t border-required" id="exp_institucional" value="0" name="exp_institucional" disabled maxlength="255">
              </div>
              <div class="col-md-4">
                <label class="label-form" for="exp_general">Experiencia General</label>
                <input type="text" class="form-control input-form color-t border-required" id="exp_general" value="0" name="exp_general" disabled maxlength="255">
              </div>
              <div class="invalid-feedback">
                Este campo es obligatorio
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="modo_trabajo">Modalidad de Trabajo <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="modo_trabajo" placeholder='Cargo...' >
                <option value="" selected disabled>Seleccione...</option>
                <option value="Presencial">Presencial</option>
                <option value="Virtual">Virtual</option>
                <option value="Alternancia">Alternancia</option>
              </select>
              <div class="invalid-feedback">
                Debe seleccionar este campo
              </div>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form" for="modo_trabajo">Abjuntar un archivo</label>
              <input type="file" class="form-control input-form color-t border-required desactivar" id="archivo_lab" name="archivo_lab " accept=".doc,.docx, .pdf" maxlength="255">
              <input type="hidden" id="arch_lab" name="arch_lab">
			  <!-- Aquí se muestra el archivo ya guardado -->
				<div id="archivo_lab_vista" class="mt-2"></div>
            </div>
          </div>
        </div>
      </div>
	  
	   <div class="col-md-12 mb-3 d-none" id="info_laboral">
        <h6 class="submenus">INFORMACIÓN LABORAL ACTUAL</h6>
        <input type="hidden" id="id_tercero">
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones">
            <div class="col-md-4 mb-2">
              <label class="label-form" for="dependencia_ula">Dependencia</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="dependencia_ula" name="dependencia_ula" placeholder="Dependencia...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="sede_ula">Sede</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="sede_ula" name="sede_ula" placeholder="Sede...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="cargo_ula">Cargo</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="cargo_ula" name="cargo_ula" placeholder="Cargo...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

	<!-- incapacidad -->
    <div class="tab-pane fade" id="incapacidad" role="tabpanel">
      
        <h6 class="submenus">INCAPACIDAD</h6>
        <input type="hidden" id="id_tercero">
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones">
            <div class="col-md-4 mb-2">
              <label class="label-form" for="tipo_inc">Tipo Incapacidad</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="tipo_inc" name="tipo_inc">
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="fecha_inc">Fecha de Incapacidad</label>
              <input type="date" class="form-control input-form color-t border-required" disabled id="fecha_inc" name="fecha_inc">
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="dias_inc">Dias de Incapacidad</label>
              <input type="number" class="form-control input-form color-t border-required" disabled id="dias_inc" name="dias_inc">
            </div>
          </div>
        </div>
      
    </div>
	
	<!-- seguridadsoc -->
    <div class="tab-pane fade" id="seguridadsoc" role="tabpanel">
      
      <div class="col-md-12 mb-3 d-none" id="seguridad_social">
        <h6 class="submenus">SEGURIDAD SOCIAL</h6>
        <input type="hidden" id="id_tercero">
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones">
            <div class="col-md-4 mb-2">
              <label class="label-form" for="eps_ula">Entidad de salud</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="eps_ula" name="eps_ula" placeholder="EPS...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="admin_pension_ula">Administradora de pensión</label>
              <input type="text" maxlength="12" class="form-control input-form color-t border-required" disabled id="admin_pension_ula" name="admin_pension_ula" placeholder="Administradora de Pensión...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="censantias_ula">Fondo de Cesantias</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="censantias_ula" name="censantias_ula" placeholder="Fondo de Cesantias...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="arl_ula">ARL</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="arl_ula" name="arl_ula" placeholder="ARL...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="compensacion_ula">Caja de Compensación</label>
              <input type="text" class="form-control input-form color-t border-required" disabled id="compensacion_ula" name="compensacion_ula" placeholder="Caja de Compensacion...">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="ret_segurdad_ula">Fecha Retiro Seguridad</label>
              <input type="date" class="form-control input-form color-t border-required" disabled id="ret_segurdad_ula" name="ret_segurdad_ula">
              <div class="invalid-feedback">
                Debe seleccionar el Cargo
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	<!-- caractvivi -->
    <div class="tab-pane fade" id="caractvivi" role="tabpanel">
       
        <h6 class="submenus">CARACTERISTICAS DE LA VIVIENDA</h6>
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones">
            <div class="col-md-4">
              <label for="sexo" class="label-form">Vivienda <span style="color: red;">*</span></label>
              <div class="form-inline">
                <div class="custom-control custom-radio pr-3">
                  <label class="custom-control-label label-form" for="Propia">Propia</label>
                  <input type="radio" class="custom-control-input desactivar" id="Propia" name="vivienda" value="1" >
                  <!-- </div>
            <div class="custom-control custom-radio pr-3"> -->
                  <label class="custom-control-label label-form" for="Arriendo">Arriendo</label>
                  <input type="radio" class="custom-control-input desactivar" id="Arriendo" name="vivienda" value="0" >
				   <label class="custom-control-label label-form" for="Familiar">Familiar</label>
                  <input type="radio" class="custom-control-input desactivar" id="Familiar" name="vivienda" value="2">
                  <div class="invalid-feedback">
                    Esta opción es requerida
                  </div>
                </div>
              </div><br>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="vivienda_estado">Estado de la vivienda <span style="color: red;">*</span></label>
              <select class="form-control input-form color-t border-required desactivar" id="vivienda_estado" >
                <option value="" selected disabled>Seleccione...</option>
                <option value="BUENA" >Buena</option>
                <option value="MAL">Mal</option>
                <option value="AGRIETADA">Agrietada</option>
                <option value="EN ZONA DE RIESGO">En zona de riesgo</option>
              </select>
              <div class="invalid-feedback">
                Esta opción es requerida
              </div>
            </div>
          </div>
        </div>
      
    </div>
	
	<div class="tab-pane fade" id="procdicp" role="tabpanel">
		<div class="col-md-12 mb-3 d-none" id="pros_disc">
        <h6 class="submenus">PROCESOS DISCIPLINARIO</h6>
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones inp_procesos">
            <div class="col-md-2">
              <label for="sexo" class="label-form">Tiene Procesos disciplinario <span style="color: red;">*</span></label>
              <div class="form-inline">
                <div class="custom-control custom-radio pr-3">
                  <label class="custom-control-label label-form" for="si_procesos">Si</label>
                  <input type="radio" class="custom-control-input desactivar" id="si_procesos" name="procesos_disc" value="1" >
                  <label class="custom-control-label label-form" for="no_procesos">No</label>
                  <input type="radio" class="custom-control-input desactivar" id="no_procesos" name="procesos_disc" value="0" >
                  <div class="invalid-feedback">
                    Esta opción es requerida
                  </div>
                </div>
              </div><br>
            </div>
            <div class="col-md-4 mb-2 proceso_disciplinario ">
              <label class="label-form" for="numero_proceso">Proceso Número</label>
              <input type="text" class="form-control input-form color-t border-required desactivar" required id="numero_proceso" name="numero_proceso" placeholder="Proceso Número...">
            </div>
            <div class="col-md-4 mb-2 proceso_disciplinario ">
              <label class="label-form" for="fecha_proceso">Fecha del Proceso</label>
              <input type="date" class="form-control input-form color-t border-required desactivar" required id="fecha_proceso" name="fecha_proceso" placeholder="Proceso Número...">
            </div>
          </div>
        </div>
      </div>
	</div>


	<div class="tab-pane fade" id="expprev" role="tabpanel">
		  <div class="col-md-12 mb-3 d-none" id="exp_laboral">
        <h6 class="submenus">EXPERIENCIA PREVIA</h6>
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="col-md-2 p-0 m-2 mb-0">
            <button class="btn btn-success btn-sm btn-pdd desactivar" id="BtnAddExp" name="BtnMdlCrearcaja" data-toggle="modal" data-target="#crearcaja">
              <i class="fa fa-plus-circle"></i></button>
          </div>
          <div id="experiencia_cont" class="row padding-secciones">
            <div class="row padding-secciones experiencia_anterior">
              <div class="row">
                <div class="col-md-3 mb-2">
                  <button class="btn btn-danger btn-sm desactivar" name="btnEliminarExp" style="float:left" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>
                </div>
              </div>
              <div class="row padding-secciones">
                <input type="hidden" class="id_experiencia" value="0" name="id_experiencia">
                <div class="col-md-6 mb-2">
                  <label class="label-form" for="nombre_empresa">Nombre de la empresa</label>
                  <input type="text" class="form-control input-form color-t border-required nombre_empresa desactivar" id="" name="nombre_empresa" placeholder="Nombre de la Empresa...">
                </div>
                <div class="col-md-6 mb-2">
                  <label class="label-form" for="cargo_exp">Cargo</label>
                  <input type="text" class="form-control input-form color-t border-required cargo_exp desactivar" id="" name="cargo_exp" placeholder="Cargo...">
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="fecha_ingreso_exp">Fecha de Ingreso</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_ingreso_exp desactivar" id="" name="fecha_ingreso_exp">
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="fecha_retiro_exp">Fecha de Retiro</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_retiro_exp desactivar" id="" name="fecha_retiro_exp">
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="funciones_exp">Funciones</label>
                  <input type="text" class="form-control input-form color-t border-required funciones_exp desactivar" id="" name="Funciones_exp" placeholder="Funciones...">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-12 mb-3 d-none" id="exp_laboral_inst">
        <h6 class="submenus">EXPERIENCIA INSTITUCIONAL</h6>
        <input type="hidden" id="id_tercero">
        <div class="secciones" style="padding-left: 12px;padding-right: 12px;">
          <div class="row padding-secciones" id="experiencia_inst">
          </div>
        </div>
      </div>
	</div>
		
  </div>
  <hr>
 <div class="col-md-12 mb-5" style="flex-direction: row-reverse" id="btns">
      <button class="btn btn-danger btn-sm desactivar" disabled id="delete_fun" style="float:right; margin: 0 7px;" type="button"> <i class="fa fa-save"></i> ELIMINAR</button>
      <button class="btn color-button desactivar" id="btnMakeSaldoinicla" style="float:right; margin: 0 7px;" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
      <button class="btn color-button" id="btnMakeEditar" style="float:right; margin: 0 7px;" type="button" disabled> <i class="fa fa-save"></i> EDITAR</button>
      <button class="btn color-button " id="btnIrAtras" style="float:right; margin: 0 7px;" type="button"> <i class="fa fa-save"></i> IR ATRAS</button>
    </div>

</form>


</body>

<script type="text/javascript" src="views/js/administrador/datos/hojavida.js"></script>

</html>