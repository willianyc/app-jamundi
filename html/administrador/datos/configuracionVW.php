
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<!-- <script type="text/javascript" src="views/js/administrador/datos/capacitacion.js"></script> -->

<h5>Configuración</h5>
<hr>
<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <form action="" class="mb-3">
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Configuraciones </h6>
      <input type="hidden" id="id_seguridadsocial">
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-4 mb-2">
              <label class="label-form" for="etnia">Étnia <span style="color: red;"></span></label>
              <input type="text" required class="form-control input-form color-t border-required" id="etnia" name="etnia" placeholder="etnia">
              <div class="invalid-feedback">
                Debe ingresar la Étnia
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="nombre">Estado civil  <span style="color: red;"></span></label>
              <input type="text" required class="form-control input-form color-t border-required" id="nombre" name="nombre" placeholder="Estado civil">
              <div class="invalid-feedback">
                Debe ingresar el Estado civil 
              </div>
            </div>

            <div class="col-md-4 mb-2">
              <label class="label-form" for="nombre">Tipo de sangre  <span style="color: red;"></span></label>
              <input type="text" required class="form-control input-form color-t border-required" id="nombre" name="nombre" placeholder="Estado civil">
              <div class="invalid-feedback">
                Debe ingresar el Tipo de sangre
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Configuracion profesional</h6>
      <input type="hidden" id="id_seguridadsocial">
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-4 mb-2">
              <label class="label-form" for="etnia">Profesión <span style="color: red;"></span></label>
              <input type="text" required class="form-control input-form color-t border-required" id="etnia" name="etnia" placeholder="Profesión">
              <div class="invalid-feedback">
                Debe ingresar la Profesión
              </div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form" for="nombre">Nivel educativo  <span style="color: red;"></span></label>
              <input type="text" required class="form-control input-form color-t border-required" id="nombre" name="nombre" placeholder="Nivel educativo">
              <div class="invalid-feedback">
                Debe ingresar el Nivel educativo 
              </div>
            </div>

            <div class="col-md-4 mb-2">
              <label class="label-form" for="nombre">Posgrado  <span style="color: red;"></span></label>
              <input type="text" required class="form-control input-form color-t border-required" id="nombre" name="nombre" placeholder="Posgrado">
              <div class="invalid-feedback">
                Debe ingresar el Posgrado
              </div>
            </div>

            <div class="col-md-4 mb-2">
              <label class="label-form" for="nombre">Cargo  <span style="color: red;"></span></label>
              <input type="text" required class="form-control input-form color-t border-required" id="nombre" name="nombre" placeholder="Cargo">
              <div class="invalid-feedback">
                Debe ingresar el Cargo
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-12 mb-2">
      <button class="btn color-button" id="btnGuardar" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
      <button class="btn color-button" id="btnAtras" required="" style="float:right;margin-right: 15px" type="button"> <i class="fa fa-arrow-left"></i> IR ATRAS</button>
    </div>
  </form>