<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<!-- <script type="text/javascript" src="views/js/administrador/datos/seguridadSocial.js"></script> -->

<h5>ASIGNACIÓN DE RECURSOS EDUCATIVOS</h5>
<hr>
<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <form action="" class="mb-3">
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Datos de la capacitación</h6>
      <input type="hidden" id="id_funcionario">
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-4 mb-2">
              <label class="label-form">Identificación</label>
              <input type="text" class="form-control input-form border-required color-t" required="" name="identificacionCapacitacion" id="identificacionCapacitacion" placeholder="Identificación...">
              <div class="invalid-feedback">Debe ingresar la identificación</div>
            </div>
            <div class="col-md-4 mb-2">
              <label class="label-form">Nombre</label>
              <input type="text" class="form-control input-form border-required color-t" required="" name="nombreCapacitacion" id="nombreCapacitacion" placeholder="Identificación...">
              <div class="invalid-feedback">Debe ingresar el Nombre</div>
            </div>
            <div class="col-md-4 pl-0">
              <button type="button" id="btnBuscar" class="btn btn-otros"><i class="fa fa-eye"></i> BUSCAR</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Subir archivo</h6>
      <input type="hidden" id="id_seguridadsocial">
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
           <div class="col-md-6 mb-2">
              <label class="label-form">Adjuntar archivo</label>
              <input type="file" class="form-control input-form border-required color-t" name="archivo_incapacidad" required="" id="archivo_incapacidad" placeholder="Diagnóstico...">
              <div class="invalid-feedback">Debe ingresar el Archivo.</div>
            </div>
            <label class="label-form" for="descripcion">Descripcion:</label>
            <hr>
            <label class="label-form" for="tamaño">Tamaño:</label>
            <hr>
            <label class="label-form" for="fecha_publicacion">Fecha de publicación:</label>
            <hr>
            <label class="label-form" for="estado">Estado:</label>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12 mb-2">
      <button class="btn color-button" id="btnGuardar" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
    </div>
  </form>