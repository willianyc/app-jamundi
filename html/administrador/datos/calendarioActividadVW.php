<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/calendarioCapacitacion.js"></script>
<link href='views/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='views/fullcalendar/lib/main.min.js'></script>
<script src='views/fullcalendar/lib/main.js'></script>
<script src='views/fullcalendar/lib/locales/es.js'></script>


<h5>CALENDARIO ACVTIVIDAD</h5>
<hr>
<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <form action="" class="mb-3">
    <div id='calendar'></div>
  </form>

  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar evento</h5>
        <button type="button" class="close closeMdl" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-8 mb-2">
              <label class="label-form" for="identificacion">Título</label>
              <input type="text" class="form-control color-t border-required" id="identificacion" name="identificacion" placeholder="Título...">
              <div class="invalid-feedback">
                  Debe ingresar la Título
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-2">
              <label class="label-form" for="identificacion">Hora</label>
              <input type="time" class="form-control color-t border-required" id="identificacion" name="identificacion" placeholder="Hora...">
              <div class="invalid-feedback">
                  Debe ingresar la Hora
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-8 mb-2">
            <label class="label-form" for="Descripción">Descripción</label>
            <textarea type="text" class="form-control color-t border-required" id="Descripción" name="Descripción" maxlength="255" value="" required="" placeholder="Descripción..."></textarea>
            <div class="invalid-feedback">
              Este campo es requerido
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-2 mb-2">
            <label class="label-form" for="Descripción">Color</label>
            <input type="color" class="form-control color-t border-required" id="Descripción" name="Descripción" maxlength="255" value="" required="" placeholder="Descripción..."></textarea>
            <div class="invalid-feedback">
              Este campo es requerido
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success">Agregar</button>
        <button type="button" class="btn btn-secondary closeMdl">Cancelar</button>
      </div>
    </div>
  </div>
</div>