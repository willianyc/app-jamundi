<h5>Entrega del cargo</h5>
<hr>

<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <form action="">
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Información del funcionario</h6>
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-6 mb-2">
              <label class="label-form">Busque el funcionario</label>
              <input type="number" class="form-control input-form border-required color-t" name="identificacion" id="identificacion" placeholder="Identificación...">
              <div class="invalid-feedback">Debe ingresar la identificación</div>
            </div>
            <div class="col-md-3 pl-0">
              <button type="button" id="btnBuscar" class="btn btn-otros"><i class="fa fa-eye"></i> BUSCAR</button>
            </div>
          </div>
          <div class="col-md-4 mb-2">
            <label class="label-form" for="nombres">Nombres</label>
            <input disabled type="text" class="form-control input-form color-t borderd-required" id="nombres" name="apellido_primer" maxlength="255" value="" placeholder="Nombre">
          </div>
          <div class="col-md-4 mb-2">
            <label class="label-form" for="direccion">Dirección</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="direccion" name="direccion" maxlength="255" value="" placeholder="Dirección">
          </div>
          <div class="col-md-4 mb-2">
            <label class="label-form" for="telefono">Teléfono</label>
            <input disabled type="text" placeholder="Teléfono" class="form-control input-form color-t border-required" id="telefono" name="telefono" maxlength="255" value="">
          </div>
          <div class="col-md-4 mb-2">
            <label class="label-form" for="correo">Correo electronico</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="correo" name="correo" maxlength="255" value="" placeholder="Correo electronico">
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Informacion laboral</h6>
      <input type="hidden" id="id_funcionario">
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="col-md-3 mb-2">
            <label class="label-form" for="cargo_propiedad">cargo en propiedad</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="cargo_propiedad" name="cargo_propiedad" maxlength="255" value="" placeholder="Cargo en propiedad">
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="nivel">Nivel</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="nivel" name="nivel" maxlength="255" value="" placeholder="Nivel">
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="codigo">Código</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="codigo" name="codigo" maxlength="255" value="" placeholder="Código">
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="grado">Grado</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="grado" name="grado" maxlength="255" value="" placeholder="Grado">
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="Dependencia">Dependencia</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="Dependencia" name="Dependencia" maxlength="255" value="" placeholder="Dependencia">
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="sede">Sede</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="sede" name="sede" maxlength="255" value="" placeholder="Sede">
          </div>
          <div class="col-md-3 mb-2">
            <label class="label-form" for="cargo">Cargo</label>
            <input disabled type="text" class="form-control input-form color-t border-required" id="cargo" name="cargo" maxlength="255" value="" placeholder="Cargo">
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12" id="retiros">
      <div class="row retiros_f">
        <div class="col-md-12 mb-2 d-none tipo_ret">
          <h6 class="submenus">Tipo de entrega</h6>
          <div class="secciones">
            <div class="row padding-secciones">
              <div class="col-md-4 mb-2">
                <label class="label-form">Tipo de entrega <span style="color: red;">*</span></label>
                <select class="form-control input-form color-t border-required tipo_retiro" placeholder='Cargo...' required="">
                  <option value="" selected disabled>Seleccione...</option>
                  <option value="Retiro">Retiro</option>
                  <option value="Entrega del cargo">Entrega del cargo</option>
                </select>
                <div class="invalid-feedback">Debe ingresar la identificación</div>
              </div>
              <div class="col-md-4 mb-2">
                <label class="label-form" for="modo_trabajo">Causas de retito <span style="color: red;">*</span></label>
                <select class="form-control input-form color-t border-required causa_retiro" placeholder='Cargo...' required="">
                  <option value="" selected disabled>Seleccione...</option>
                </select>
              </div>
              <div class="col-md-4 mb-2 d-none otro_">
                <label class="label-form" for="modo_trabajo">Cual? <span style="color: red;">*</span></label>
                <input type="text" class="form-control input-form color-t border-required otra_causa">
              </div>
              <!-- <div class="col-md-6 mb-2">
            <input disabled type="text" class="form-control input-form color-t border-required" id="causa_retiro_com" disabled>
          </div> -->
            </div>
          </div>
        </div>
        <div class="col-md-12 mb-2 d-none lista_chequeo">
          <h6 class="submenus">Lista de Chequeo de Documento</h6>
          <input type="hidden id_retiro">
          <div class="secciones">
            <div class="row padding-secciones">
              <div class="col-md-4">
                <label for="sexo" class="label-form">1. Acta de informe de gestión para entrega del cargo.</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos">Si</label>
                    <input type="radio" class="custom-control-input si_procesos" name="procesos_disc" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos">No</label>
                    <input type="radio" class="custom-control-input no_procesos" name="procesos_disc" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica" name="procesos_disc" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">2. Examen médico de egreso de la entidad. </label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_2">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_2" name="examen_med" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_2">No</label>
                    <input type="radio" class="custom-control-input no_procesos_2" name="examen_med" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_2">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_2" name="examen_med" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">3. Comprobante devolución de bienes al Almacén General – paz y salvo</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_3">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_3" name="comprobante_dev" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_3">No</label>
                    <input type="radio" class="custom-control-input no_procesos_3" name="comprobante_dev" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_3">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_3" name="comprobante_dev" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">4. Hoja de vida de la función pública (SIGEP) actualizada.</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_4">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_4" name="hoja_vida" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_4">No</label>
                    <input type="radio" class="custom-control-input no_procesos_4" name="hoja_vida" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_4">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_4" name="hoja_vida" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">5. Declaración de bienes y rentas (SIGEP) de retiro.</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_5">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_5" name="declariacion_renta" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_5">No</label>
                    <input type="radio" class="custom-control-input no_procesos_5" name="declariacion_renta" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_5">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_5" name="declariacion_renta" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <label for="sexo" class="label-form">6. Carné de servidor público (en caso de que aplique).</label>
                <div class="form-inline">
                  <div class="custom-control custom-radio pr-3">
                    <label class="custom-control-label label-form" for="si_procesos_6">Si</label>
                    <input type="radio" class="custom-control-input si_procesos_6" name="carnet_servidor" value="SI">
                    <!-- </div>
                <div class="custom-control custom-radio pr-3"> -->
                    <label class="custom-control-label label-form" for="no_procesos_6">No</label>
                    <input type="radio" class="custom-control-input no_procesos_6" name="carnet_servidor" value="NO">
                    <label class="custom-control-label label-form" for="no_aplica_6">No Aplica</label>
                    <input type="radio" class="custom-control-input no_aplica_6" name="carnet_servidor" checked value="NO APLICA">
                    <div class="invalid-feedback">
                      Esta opción es requerida
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mt-3">
                <!-- <div class="col-md-4">
              <label class="label-form">abjuntar paz y salvo</label>
              <input type="file" class="form-control input-form color-t border-required paz_salvo" name="paz_salvo" required placeholder="Subir Paz y Salvo">
            </div> -->
                <div class="col-md-4 mb-2">
                  <label class="label-form">Fecha de Novedad</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_retiro" name="fecha_retiro" maxlength="255" value="" disabled>
                  <div class="invalid-feedback">
                    Esta opción es requerida
                  </div>
                </div>
                <div class="col-md-4 mb-2">
                  <label for="fecha_recepcion" class="label-form">Fecha de recepción</label>
                  <input type="date" class="form-control input-form color-t border-required fecha_recepcion" required>
                  <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                </div>
                <div class="col-md-4 mb-2">
                  <label class="label-form" for="modo_trabajo">Abjuntar un archivo</label>
                  <input type="file" class="form-control input-form color-t border-required archivo_ret" name="archivo_ret " accept=".doc,.docx, .pdf" maxlength="255">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-12 mb-5">
          <button class="btn color-button btnGuardar" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
        </div>
      </div>
      <br>
    </div>
  </form>
</div>
<script type="text/javascript" src="views/js/administrador/datos/retiro.js"></script>