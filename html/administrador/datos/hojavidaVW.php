<?php
?>
<!-- ===========================
     ESTILOS GESTIÓN HOJA DE VIDA
     =========================== -->
<style>

  /* ------------------------------
   🔵 TABS TIPO SOLAPA MODERNA
   ------------------------------ */
.hv-tabs {
    border: none;
    display: flex;
    gap: 8px;
}

.hv-tabs .nav-link {
    border: none !important;
    background: #f1f4ff;
    color: #1a3d7c;
    font-weight: 600;
    border-radius: 12px;
    padding: 10px 18px;
    transition: .25s ease;
    font-size: 0.85rem;
    box-shadow: inset 0 0 0 1px #d6dcf5;
}

.hv-tabs .nav-link:hover {
    background: #e2e7ff;
    color: #0a2e6b;
}

.hv-tabs .nav-link.active {
    background: #0d6efd;
    color: white;
    box-shadow: 0 2px 6px rgba(0,0,0,0.15);
    transform: translateY(-1px);
}

.hv-tabs .nav-link:focus {
    outline: none !important;
    box-shadow: none !important;
}

/* Contenedor */
.hv-tab-content {
    background: white;
    border-radius: 14px;
    padding: 25px;
    margin-top: 15px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

  /* -----------------------------
     CONTENEDOR GENERAL / TARJETA
     ----------------------------- */
  .hv-wrapper {
    background: #f3f4f6;
    padding: 20px;
    border-radius: 16px;
  }

  .hv-card {
    background: #ffffff;
    border-radius: 14px;
    box-shadow: 0 4px 10px rgba(15, 23, 42, 0.08);
    padding: 18px 22px 24px;
    margin-top: 14px;
  }

  .hv-card-title {
    font-size: 0.95rem;
    font-weight: 600;
    color: #111827;
    margin-bottom: 10px;
  }

  /* -----------------------------
     TÍTULO Y BOTÓN REGRESAR
     ----------------------------- */
  .hv-header-title {
    font-size: 1.15rem;
    font-weight: 700;
    color: #111827;
  }

  /* Botón regresar pequeño */
  .btn-secondary.btn-sm {
    background: #0A4DFA !important;
    border: none !important;
    padding: 4px 14px !important;
    font-size: 0.75rem !important;
    border-radius: 999px !important;
  }

  .btn-secondary.btn-sm i {
    font-size: 0.7rem;
  }

  /* -----------------------------
     TABS MODERNAS COMPACTAS
     ----------------------------- */
  #hojaVidaTabs {
    border-bottom: none;
    margin-bottom: 0;
  }

  #hojaVidaTabs .nav-item {
    margin-right: 4px;
    margin-bottom: 4px;
  }

  #hojaVidaTabs .nav-link {
    font-size: 0.72rem;
    padding: 0.35rem 0.75rem;
    border-radius: 999px;
    border: 1px solid #d1d5db;
    background-color: #f9fafb;
    color: #4b5563;
    font-weight: 600;
  }

  #hojaVidaTabs .nav-link:hover {
    background-color: #e5f0ff;
    color: #111827;
  }

  #hojaVidaTabs .nav-link.active {
    background: linear-gradient(135deg, #005DFF, #0A4DFA);
    border-color: #0A4DFA;
    color: #ffffff;
    box-shadow: 0 2px 7px rgba(37, 99, 235, 0.3);
  }

  /* -----------------------------
     GRID 3 COLUMNAS
     ----------------------------- */
  .hv-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 12px 18px;
    margin-top: 4px;
  }

  /* Span de columnas según necesidad */
  .hv-span-2 {
    grid-column: span 2;
  }

  .hv-span-3 {
    grid-column: span 3;
  }

  @media (max-width: 1200px) {
    .hv-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 768px) {
    .hv-wrapper {
      padding: 10px;
    }

    .hv-grid {
      grid-template-columns: 1fr;
    }

    .hv-photo-container {
      justify-self: center !important;
    }
  }

  /* -----------------------------
     CAMPOS / LABELS
     ----------------------------- */
  .hv-field label,
  .label-form {
    font-size: 0.78rem;
    font-weight: 600;
    color: #374151;
    margin-bottom: 4px;
  }

  .hv-field .form-control,
  .input-form,
  .input-table {
    border-radius: 999px !important;
    border: 1px solid #d1d5db !important;
    background-color: #f9fafb !important;
    font-size: 0.78rem !important;
    padding: 6px 14px !important;
    color: #111827 !important;
    height: 32px !important;
  }

  .hv-field input[type="date"].form-control {
    padding-right: 8px !important;
  }

  .hv-field .form-control:focus {
    border-color: #0A4DFA !important;
    box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.25) !important;
    background-color: #ffffff !important;
  }

  .hv-field select.form-control {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg width='12' height='8' viewBox='0 0 12 8' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1 1L6 6L11 1' stroke='%236B7280' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 12px 8px;
  }

  .hv-field .invalid-feedback {
    font-size: 0.7rem;
  }

  /* -----------------------------
     FOTO / AVATAR FUNCIONARIO
     ----------------------------- */
  .hv-photo-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    border-radius: 16px;
    background: #f3f4ff;
    padding: 14px 10px;
  }

  .hv-photo-avatar {
    width: 86px;
    height: 86px;
    border-radius: 999px;
    background: #e5e7eb;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
    overflow: hidden;
    border: 1px solid #d1d5db;
  }

  .hv-photo-avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .hv-photo-placeholder {
    font-size: 2rem;
    color: #9ca3af;
  }

  .hv-photo-input {
    font-size: 0.7rem;
    text-align: center;
  }

  /* -----------------------------
     BOTONERA FINAL
     ----------------------------- */
  #btns .btn {
    border-radius: 999px !important;
    font-size: 0.8rem !important;
    padding: 6px 14px !important;
  }

  #btns .color-button {
    background: linear-gradient(135deg, #005DFF, #0A4DFA) !important;
    color: #ffffff !important;
    border: none !important;
  }

  #btns .btn-danger.btn-sm {
    border-radius: 999px !important;
    font-size: 0.8rem !important;
    padding: 6px 14px !important;
  }

  .acad-card {
    border: 1px solid #e3e6f0;
    border-radius: 12px;
    background: #ffffff;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.acad-card .label-form {
    font-size: 0.85rem;
    font-weight: 600;
    color: #344767;
}

.input-form {
    border-radius: 10px;
    padding: 8px 10px;
}



.fam-card {
    border: 1px solid #e3e6f0;
    border-radius: 12px;
    background: #fff;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.label-form {
    font-weight: 600;
    font-size: .85rem;
}

.input-form {
    border-radius: 8px !important;
}

</style>

<div class="d-flex justify-content-between align-items-center mb-3">
  <h5 class="mb-0 hv-header-title">GESTIÓN HOJA DE VIDA</h5>
  <button type="button" class="btn btn-secondary btn-sm" onclick="window.history.back();">
    <i class="fa fa-arrow-left"></i> Regresar
  </button>
</div>

<div class="hv-wrapper">
  <form action="" class="mb-3" enctype="multipart/form-data">
    <!-- NAV TABS -->
    <ul class="nav hv-tabs" id="hojaVidaTabs" role="tablist">

    <li class="nav-item" role="presentation">
        <button class="nav-link active" id="funcionario-tab"
            data-bs-toggle="tab" data-bs-target="#funcionario" type="button">
            Información Funcionario
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="academica-tab"
            data-bs-toggle="tab" data-bs-target="#academica" type="button">
            Información Académica
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="familiar-tab"
            data-bs-toggle="tab" data-bs-target="#familiar" type="button">
            Información Familiar
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="experiencialab-tab"
            data-bs-toggle="tab" data-bs-target="#experiencialab" type="button">
            Información Laboral
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="seguridadsoc-tab"
            data-bs-toggle="tab" data-bs-target="#seguridadsoc" type="button">
            Seguridad Social
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="incapacidad-tab"
            data-bs-toggle="tab" data-bs-target="#incapacidad" type="button">
            Incapacidad
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="caractvivi-tab"
            data-bs-toggle="tab" data-bs-target="#caractvivi" type="button">
            Características de la Vivienda
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="procdicp-tab"
            data-bs-toggle="tab" data-bs-target="#procdicp" type="button">
            Procesos Disciplinarios
        </button>
    </li>

    <li class="nav-item" role="presentation">
        <button class="nav-link" id="expprev-tab"
            data-bs-toggle="tab" data-bs-target="#expprev" type="button">
            Experiencia Previa
        </button>
    </li>

</ul>

<div class="tab-content hv-tab-content" id="hojaVidaTabsContent">

    <!-- TAB CONTENT -->
  

      <!-- =============================
           TAB 1: INFORMACIÓN FUNCIONARIO
           ============================= -->
      <div class="tab-pane fade show active" id="funcionario" role="tabpanel">
        <div class="hv-card">
          <div class="hv-grid" id="info_funcionario">
            <input type="hidden" id="id_funcionario" value="">

            <!-- FOTO / AVATAR (ocupa 1 col pero se ve como tarjeta) -->
            <div class="hv-field hv-photo-container hv-span-1 hv-photo-box" style="grid-row: span 4;">
              <div class="hv-photo-avatar">
                <img id="blah" name="blah" src="#" alt="Foto funcionario" style="display:none;">
                <i class="fa fa-user hv-photo-placeholder" id="avatar_placeholder"></i>
              </div>
              <label class="label-form mb-1" for="archivo">Foto del funcionario</label>
              <input type="file" class="form-control hv-photo-input desactivar" id="archivo" name="archivo" accept="image/*">
              <input type="hidden" id="foto" name="foto">
            </div>

            <!-- PRIMERA LÍNEA -->
            <div class="hv-field">
              <label for="tipo_documento">Tipo de documento</label>
              <select class="form-control desactivar" id="tipo_documento">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar el Tipo de documento</div>
            </div>

            <div class="hv-field">
              <label for="cedula">N° Identificación <span style="color:red">*</span></label>
              <input type="number" class="form-control desactivar" id="cedula" name="cedula" placeholder="N° Identificación...">
              <div class="invalid-feedback">Debe digitar la identificación</div>
            </div>

            <div class="hv-field">
              <label for="nombres">Nombres <span style="color:red">*</span></label>
              <input type="text" class="form-control desactivar" id="nombres" name="nombres_primer" placeholder="Nombres completos...">
              <div class="invalid-feedback">Debe escribir los nombres</div>
            </div>

            <div class="hv-field">
              <label for="apellidos">Apellidos <span style="color:red">*</span></label>
              <input type="text" class="form-control desactivar" id="apellidos" name="apellido_primer" placeholder="Apellidos completos...">
              <div class="invalid-feedback">Debe escribir los apellidos</div>
            </div>

            <!-- PAÍS / FECHA / EDAD -->
            <div class="hv-field">
              <label for="pais_nacimiento">País de nacimiento</label>
              <select id="pais_nacimiento" name="pais_nacimiento" class="form-control desactivar" required></select>
            </div>

            <div class="hv-field">
              <label for="fecha_nac">Fecha de nacimiento <span style="color:red">*</span></label>
              <input type="date" class="form-control desactivar" id="fecha_nac">
              <div class="invalid-feedback">Debe seleccionar la fecha</div>
            </div>

            <div class="hv-field">
              <label for="edad">Edad</label>
              <input type="text" class="form-control" id="edad" name="edad" placeholder="Edad..." disabled>
            </div>

            <!-- CIUDAD / CELULAR / CORREO -->
            <div class="hv-field" id="div_depto" style="display:none;">
              <label for="departamento_nacimiento">Departamento de nacimiento</label>
              <select id="departamento_nacimiento" name="departamento_nacimiento" class="form-control desactivar"></select>
            </div>

            <div class="hv-field" id="div_ciudad" style="display:none;">
              <label for="ciudad_nacimiento">Ciudad de nacimiento</label>
              <select id="ciudad_nacimiento" name="ciudad_nacimiento" class="form-control desactivar"></select>
            </div>

            <div class="hv-field" id="div_ciudad_extranjero" style="display:none;">
              <label for="ciudad_extranjero">Ciudad (extranjero)</label>
              <input type="text" id="ciudad_extranjero" name="ciudad_extranjero" class="form-control desactivar" placeholder="Ciudad...">
            </div>

            <div class="hv-field">
              <label for="telefono">Celular <span style="color:red">*</span></label>
              <input type="number" class="form-control desactivar" id="telefono" name="telefono" placeholder="Celular...">
              <div class="invalid-feedback">Debe digitar el celular</div>
            </div>

            <div class="hv-field hv-span-2">
              <label for="correo">Correo <span style="color:red">*</span></label>
              <input type="email" class="form-control desactivar" id="correo" name="correo" placeholder="Correo electrónico...">
              <div class="invalid-feedback">Debe escribir el correo</div>
            </div>

            <!-- RESIDENCIA -->
            <div class="hv-field">
              <label for="municipio">Municipio residencia <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="municipio">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar el municipio</div>
            </div>

            <div class="hv-field">
              <label for="otro_municipio">Otro municipio</label>
              <input type="text" class="form-control desactivar" id="otro_municipio" name="otro_municipio" placeholder="Nombre municipio..." disabled>
            </div>

            <div class="hv-field hv-span-1">
              <label for="barrio">Barrio</label>
              <input type="text" class="form-control desactivar" id="barrio" name="barrio" placeholder="Barrio...">
            </div>

            <div class="hv-field hv-span-2">
              <label for="direccion">Dirección <span style="color:red">*</span></label>
              <input type="text" class="form-control desactivar" id="direccion" name="direccion" placeholder="Dirección de residencia...">
              <div class="invalid-feedback">Debe escribir la dirección</div>
            </div>

            <!-- DATOS SOCIODEMOGRÁFICOS -->
            <div class="hv-field">
              <label for="sexo">Género <span style="color:red">*</span></label>
              <select id="sexo" name="sexo" class="form-control desactivar" required>
                <option value="">Seleccione...</option>
                <option value="M">Hombre</option>
                <option value="F">Mujer</option>
                <option value="O">No Binario</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar el género</div>
            </div>

            <div class="hv-field">
              <label for="estado_civil">Estado civil <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="estado_civil">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar este campo</div>
            </div>

            <div class="hv-field">
              <label for="tipo_sanguineo">Tipo de sangre <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="tipo_sanguineo">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar el tipo de sangre</div>
            </div>

            <div class="hv-field">
              <label for="etnia">Étnia <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="etnia">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar la etnia</div>
            </div>

            <!-- MADRE / PADRE / CABEZA FAMILIA -->
            <div class="hv-field">
              <label for="madre_padre">¿Madre o padre? <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="madre_padre">
                <option value="" selected disabled>Seleccione...</option>
                <option value="MADRE">MADRE</option>
                <option value="PADRE">PADRE</option>
                <option value="NO">NO TIENE HIJOS</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar este campo</div>
            </div>

            <div class="hv-field">
              <label for="is_cabezafamilia">¿Es cabeza de familia? <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="is_cabezafamilia">
                <option value="" selected disabled>Seleccione...</option>
                <option value="1">SI</option>
                <option value="0">NO</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar este campo</div>
            </div>

            <!-- PATOLOGÍAS -->
            <div class="hv-field">
              <label for="condicion_medica">Patologías presente <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="condicion_medica" name="condicion_medica" required>
                <option value="">Seleccione...</option>
                <option value="HIPERTENSIÓN ARTERIAL">HIPERTENSIÓN ARTERIAL</option>
                <option value="DIABETES">DIABETES</option>
                <option value="ENFERMEDAD CARDIACA">ENFERMEDAD CARDIACA</option>
                <option value="ENFERMEDAD RESPIRATORIA">ENFERMEDAD RESPIRATORIA</option>
                <option value="ENFERMEDAD RENAL">ENFERMEDAD RENAL</option>
                <option value="ENFERMEDAD MENTAL">ENFERMEDAD MENTAL</option>
                <option value="ALERGIAS">ALERGIAS</option>
                <option value="TRASTORNOS NEUROLOGICOS">TRASTORNOS NEUROLÓGICOS</option>
                <option value="ENFERMEDAD HEMATOLOGICA">ENFERMEDAD HEMATOLÓGICA</option>
                <option value="TRASTORNOS MUSCULO ESQUELETICOS">TRASTORNOS MÚSCULO-ESQUELÉTICOS</option>
                <option value="NINGUNA">NINGUNA DE LAS ANTERIORES</option>
                <option value="OTROS">OTROS</option>
              </select>
              <div class="invalid-feedback">Este campo es requerido</div>
            </div>

            <div class="hv-field hv-span-2 d-none" id="desc_condicion_group">
              <label for="desc_condicion_medica">Descripción de la patología</label>
              <input type="text" id="desc_condicion_medica" name="desc_condicion_medica" class="form-control desactivar" placeholder="Describa la condición médica...">
            </div>

            <!-- GESTACIÓN / DISCAPACIDAD -->
            <div class="hv-field">
              <label for="estado_gestacion">¿Se encuentra en estado de gestación?</label>
              <select class="form-control desactivar" id="estado_gestacion" name="estado_gestacion">
                <option value="">Seleccione...</option>
                <option value="SI">SI</option>
                <option value="NO">NO</option>
              </select>
            </div>

            <div class="hv-field">
              <label for="discapacidad">¿Se considera persona con discapacidad?</label>
              <select class="form-control desactivar" id="discapacidad" name="discapacidad">
                <option value="">Seleccione...</option>
                <option value="SI">SI</option>
                <option value="NO">NO</option>
              </select>
            </div>

            <div class="hv-field d-none" id="tipo_discapacidad_group">
              <label for="tipo_discapacidad">Tipo de discapacidad</label>
              <input type="text" id="tipo_discapacidad" name="tipo_discapacidad" class="form-control desactivar" placeholder="Describa el tipo de discapacidad...">
            </div>

            <div class="hv-field d-none" id="certificado_discapacidad_group">
              <label for="certificado_discapacidad">¿Cuenta con certificado de discapacidad?</label>
              <select class="form-control desactivar" id="certificado_discapacidad" name="certificado_discapacidad">
                <option value="">Seleccione...</option>
                <option value="SI">SI</option>
                <option value="NO">NO</option>
              </select>
            </div>

            <!-- VULNERABILIDAD / RUV -->
            <div class="hv-field hv-span-2">
              <label for="condicion_vulnerabilidad">Condición de vulnerabilidad</label>
              <select class="form-control desactivar" id="condicion_vulnerabilidad" name="condicion_vulnerabilidad"></select>
              <div class="invalid-feedback">Este campo es requerido</div>
            </div>

            <div class="hv-field">
              <label for="victima_violencia">Registro Único de Víctimas (RUV) <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="victima_violencia">
                <option value="" selected disabled>Seleccione...</option>
              </select>
              <div class="invalid-feedback">Debe seleccionar si es víctima</div>
            </div>

            <!-- SINDICATO / CARRERA / ESTADO -->
            <div class="hv-field">
              <label for="organizacion_sindical">Organización sindical</label>
              <select id="organizacion_sindical" name="organizacion_sindical" class="form-control desactivar"></select>
              <div class="invalid-feedback">Debe seleccionar una organización sindical</div>
            </div>

            <div class="hv-field">
              <label for="derecho_car_admin">¿Derechos de carrera administrativa en otra entidad?</label>
              <select id="derecho_car_admin" name="derecho_car_admin" class="form-control desactivar">
                <option value="">Seleccione...</option>
                <option value="SI">SI</option>
                <option value="NO">NO</option>
              </select>
            </div>

            <div class="hv-field">
              <label for="estado">Estado</label>
              <select class="form-control desactivar" id="estado" disabled>
                <option value="1" selected>ACTIVO</option>
                <option value="0">RETIRADO</option>
              </select>
              <input type="hidden" value="" id="is_Actualizado">
            </div>
          </div>
        </div>
      </div>

      <!-- =============================
           TAB 2: INFORMACIÓN ACADÉMICA
           ============================= -->
      <div class="tab-pane fade" id="academica" role="tabpanel">
        <div class="hv-card">
          <h6 class="hv-card-title">Información Académica</h6>
          <div class="col-md-12 mb-3 d-none" id="info_academica">
            <div class="d-flex justify-content-start mb-2">
              <button class="btn btn-success btn-sm btn-pdd desactivar" id="BtnAddInfAcad" name="BtnMdllCrearcaja" data-toggle="modal" data-target="#crearcaja">
                <i class="fa fa-plus-circle"></i>
              </button>
            </div>
            <div id="infoAcad_cont" class="row padding-secciones"></div>
            <input type="hidden" id="infoAcademicaEliminados" name="infoAcademicaEliminados">
          </div>
        </div>
      </div>

     <!-- =============================
       TAB 3: INFORMACIÓN FAMILIAR
   ============================= -->
<div class="tab-pane fade" id="familiar" role="tabpanel">
  <div class="hv-card">
      <h6 class="hv-card-title">Núcleo Familiar</h6>

      <div class="col-md-12 mb-3 d-none" id="nu_fam">

        <div class="d-flex justify-content-start mb-3">
            <button class="btn btn-success btn-sm desactivar" id="BtnAddDetalle">
                <i class="fa fa-plus-circle"></i> Agregar integrante
            </button>
        </div>

        <div id="familia_cont" class="row gy-4">
            <!-- Aquí se insertarán las tarjetas familiares -->
        </div>

      </div>
  </div>
</div>


      <!-- =============================
           TAB 4: INFORMACIÓN LABORAL
           ============================= -->
      <div class="tab-pane fade" id="experiencialab" role="tabpanel">
        <div class="hv-card">
          <h6 class="hv-card-title">Información Laboral</h6>
          <div class="col-md-12 mb-3 d-none" id="info_lab">
            <div class="hv-grid">
              <!-- Aquí solo cambian los contenedores por hv-field para el grid -->
              <div class="hv-field">
                <label for="tipo_vinculacion">Tipo de vinculación <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="tipo_vinculacion">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>
              <div class="hv-field">
                <label for="fecha_ingreso">Fecha de ingreso <span style="color:red">*</span></label>
                <input type="date" class="form-control desactivar" id="fecha_ingreso">
              </div>
              <div class="hv-field">
                <label for="ingreso">Año de ingreso <span style="color:red">*</span></label>
                <input type="text" class="form-control desactivar" id="ingreso" name="ingreso" disabled>
              </div>

              <div class="hv-field">
                <label for="nivel_sel">Nivel <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="nivel_sel">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>
              <div class="hv-field">
                <label for="cargo_propiedad">Denominación del empleo <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="cargo_propiedad">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>
              <div class="hv-field">
                <label for="codigo">Código <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="codigo">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>

              <div class="hv-field">
                <label for="grado">Grado <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="grado">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>
              <div class="hv-field">
                <label for="dependencia">Dependencia <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="dependencia">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>
              <div class="hv-field">
                <label for="num_posesion">N° acto administrativo <span style="color:red">*</span></label>
                <input type="text" class="form-control desactivar" id="num_posesion" name="num_posesion">
              </div>

              <div class="hv-field">
                <label for="fecha_resolucion">Fecha exp. resolución <span style="color:red">*</span></label>
                <input type="date" class="form-control desactivar" id="fecha_resolucion" name="fecha_resolucion">
              </div>
              <div class="hv-field">
                <label for="num_resolucion">N° acta de posesión <span style="color:red">*</span></label>
                <input type="text" class="form-control desactivar" id="num_resolucion" name="num_resolucion">
              </div>
              <div class="hv-field">
                <label for="fecha_posesion">Fecha de posesión <span style="color:red">*</span></label>
                <input type="date" class="form-control desactivar" id="fecha_posesion" name="fecha_posesion">
              </div>

              <div class="hv-field">
                <label for="sede">Sede <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="sede">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>

              <div class="hv-field">
                <label for="modo_trabajo">Modalidad de trabajo <span style="color:red">*</span></label>
                <select class="form-control desactivar" id="modo_trabajo">
                  <option value="" selected disabled>Seleccione...</option>
                  <option value="Presencial">Presencial</option>
                  <option value="Virtual">Virtual</option>
                  <option value="Alternancia">Alternancia</option>
                </select>
              </div>

              <div class="hv-field hv-span-2">
                <label for="archivo_lab">Adjuntar archivo</label>
                <input type="file" class="form-control desactivar" id="archivo_lab" name="archivo_lab" accept=".doc,.docx,.pdf">
                <input type="hidden" id="arch_lab" name="arch_lab">
              </div>

              <div class="hv-field">
                <label for="exp_previa">Experiencia previa</label>
                <input type="text" class="form-control" id="exp_previa" name="exp_previa" value="0" disabled>
              </div>
              <div class="hv-field">
                <label for="exp_institucional">Experiencia institucional</label>
                <input type="text" class="form-control" id="exp_institucional" name="exp_institucional" value="0" disabled>
              </div>
              <div class="hv-field">
                <label for="exp_general">Experiencia general</label>
                <input type="text" class="form-control" id="exp_general" name="exp_general" value="0" disabled>
              </div>
            </div>
          </div>

          <!-- LABORAL ACTUAL (mismo card, abajo) -->
          <div class="col-md-12 mb-3 d-none" id="info_laboral">
            <h6 class="hv-card-title mt-3">Información laboral actual</h6>
            <div class="hv-grid">
              <div class="hv-field">
                <label for="dependencia_ula">Dependencia</label>
                <input type="text" class="form-control" disabled id="dependencia_ula" name="dependencia_ula">
              </div>
              <div class="hv-field">
                <label for="sede_ula">Sede</label>
                <input type="text" class="form-control" disabled id="sede_ula" name="sede_ula">
              </div>
              <div class="hv-field">
                <label for="cargo_ula">Cargo</label>
                <input type="text" class="form-control" disabled id="cargo_ula" name="cargo_ula">
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- =============================
           TAB 5: INCAPACIDAD
           ============================= -->
      <div class="tab-pane fade" id="incapacidad" role="tabpanel">
        <div class="hv-card">
          <h6 class="hv-card-title">Incapacidad</h6>
          <div class="hv-grid">
            <div class="hv-field">
              <label for="tipo_inc">Tipo incapacidad</label>
              <input type="text" class="form-control" disabled id="tipo_inc" name="tipo_inc">
            </div>
            <div class="hv-field">
              <label for="fecha_inc">Fecha de incapacidad</label>
              <input type="date" class="form-control" disabled id="fecha_inc" name="fecha_inc">
            </div>
            <div class="hv-field">
              <label for="dias_inc">Días de incapacidad</label>
              <input type="number" class="form-control" disabled id="dias_inc" name="dias_inc">
            </div>
          </div>
        </div>
      </div>

      <!-- =============================
           TAB 6: SEGURIDAD SOCIAL
           ============================= -->
      <div class="tab-pane fade" id="seguridadsoc" role="tabpanel">
        <div class="hv-card">
          <h6 class="hv-card-title">Seguridad Social</h6>
          <div class="col-md-12 mb-3 d-none" id="seguridad_social">
            <div class="hv-grid">
              <div class="hv-field">
                <label for="eps_ula">Entidad de salud</label>
                <input type="text" class="form-control" disabled id="eps_ula" name="eps_ula">
              </div>
              <div class="hv-field">
                <label for="admin_pension_ula">Administradora de pensión</label>
                <input type="text" class="form-control" disabled id="admin_pension_ula" name="admin_pension_ula">
              </div>
              <div class="hv-field">
                <label for="censantias_ula">Fondo de cesantías</label>
                <input type="text" class="form-control" disabled id="censantias_ula" name="censantias_ula">
              </div>
              <div class="hv-field">
                <label for="arl_ula">ARL</label>
                <input type="text" class="form-control" disabled id="arl_ula" name="arl_ula">
              </div>
              <div class="hv-field">
                <label for="compensacion_ula">Caja de compensación</label>
                <input type="text" class="form-control" disabled id="compensacion_ula" name="compensacion_ula">
              </div>
              <div class="hv-field">
                <label for="ret_segurdad_ula">Fecha retiro seguridad</label>
                <input type="date" class="form-control" disabled id="ret_segurdad_ula" name="ret_segurdad_ula">
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- =============================
           TAB 7: CARACTERÍSTICAS VIVIENDA
           ============================= -->
      <div class="tab-pane fade" id="caractvivi" role="tabpanel">
        <div class="hv-card">
          <h6 class="hv-card-title">Características de la vivienda</h6>
          <div class="hv-grid">
            <div class="hv-field">
              <label for="vivienda">Tipo de vivienda <span style="color:red">*</span></label>
              <select id="vivienda" name="vivienda" class="form-control desactivar" required>
                <option value="" disabled selected>Seleccione...</option>
                <option value="1">Propia</option>
                <option value="2">Familiar</option>
                <option value="0">Alquiler</option>
              </select>
            </div>
            <div class="hv-field">
              <label for="estrato_socioeconomico">Estrato socioeconómico</label>
              <select id="estrato_socioeconomico" name="estrato_socioeconomico" class="form-control desactivar">
                <option value="" selected disabled>Seleccione...</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
              </select>
            </div>
            <div class="hv-field hv-span-1">
              <label for="vivienda_estado">Estado de la vivienda <span style="color:red">*</span></label>
              <select class="form-control desactivar" id="vivienda_estado">
                <option value="" selected disabled>Seleccione...</option>
                <option value="BUENA">Buena</option>
                <option value="MAL">Mal</option>
                <option value="AGRIETADA">Agrietada</option>
                <option value="EN ZONA DE RIESGO">En zona de riesgo</option>
              </select>
            </div>
            <div class="hv-field">
              <label for="necesidad_subsidio_vivienda">¿Tiene necesidad de subsidio de vivienda?</label>
              <select id="necesidad_subsidio_vivienda" name="necesidad_subsidio_vivienda" class="form-control desactivar">
                <option value="" selected disabled>Seleccione...</option>
                <option value="SI">SI</option>
                <option value="NO">NO</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      <!-- =============================
           TAB 8: PROCESOS DISCIPLINARIO
           ============================= -->
      <div class="tab-pane fade" id="procdicp" role="tabpanel">
        <div class="hv-card">
          <h6 class="hv-card-title">Procesos disciplinario</h6>
          <div class="col-md-12 mb-3 d-none" id="pros_disc">
            <div class="hv-grid">
              <div class="hv-field">
                <label class="label-form d-block">¿Tiene procesos disciplinarios? <span style="color:red">*</span></label>
                <div class="d-flex align-items-center">
                  <div class="form-check me-3">
                    <input class="form-check-input desactivar" type="radio" id="si_procesos" name="procesos_disc" value="1">
                    <label class="form-check-label label-form" for="si_procesos">Sí</label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input desactivar" type="radio" id="no_procesos" name="procesos_disc" value="0">
                    <label class="form-check-label label-form" for="no_procesos">No</label>
                  </div>
                </div>
              </div>
              <div class="hv-field">
                <label for="numero_proceso">Proceso número</label>
                <input type="text" class="form-control desactivar" id="numero_proceso" name="numero_proceso" placeholder="Proceso número...">
              </div>
              <div class="hv-field">
                <label for="fecha_proceso">Fecha del proceso</label>
                <input type="date" class="form-control desactivar" id="fecha_proceso" name="fecha_proceso">
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- =============================
           TAB 9: EXPERIENCIA PREVIA
           ============================= -->
      <div class="tab-pane fade" id="expprev" role="tabpanel">
        <div class="hv-card">
          <h6 class="hv-card-title">Experiencia previa</h6>

          <div class="col-md-12 mb-3 d-none" id="exp_laboral">
            <div class="d-flex justify-content-start mb-2">
              <button class="btn btn-success btn-sm btn-pdd desactivar" id="BtnAddExp" name="BtnMdlCrearcaja" data-toggle="modal" data-target="#crearcaja">
                <i class="fa fa-plus-circle"></i>
              </button>
            </div>
            <div id="experiencia_cont" class="row padding-secciones">
              <!-- Mantengo tu estructura interna original para no afectar la lógica -->
            </div>
          </div>

          <div class="col-md-12 mb-3 d-none" id="exp_laboral_inst">
            <h6 class="hv-card-title mt-3">Experiencia institucional</h6>
            <div class="secciones" style="padding-left:12px;padding-right:12px;">
              <div class="row padding-secciones" id="experiencia_inst"></div>
            </div>
          </div>
        </div>
      </div>

    </div> <!-- /tab-content -->

    <hr>
    <div class="col-md-12 mb-5 d-flex justify-content-end" id="btns">
      <button class="btn btn-danger btn-sm desactivar" disabled id="delete_fun" style="margin-left:7px;" type="button">
        <i class="fa fa-save"></i> Eliminar
      </button>
      <button class="btn color-button desactivar" id="btnMakeSaldoinicla" style="margin-left:7px;" type="button">
        <i class="fa fa-save"></i> Guardar
      </button>
      <button class="btn color-button" id="btnMakeEditar" style="margin-left:7px;" type="button" disabled>
        <i class="fa fa-save"></i> Editar
      </button>
      <button class="btn color-button" id="btnIrAtras" style="margin-left:7px;" type="button">
        <i class="fa fa-save"></i> Ir atrás
      </button>
    </div>
  </form>
</div>

<script type="text/javascript" src="views/js/administrador/datos/hojavida.js"></script>
