<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/evaluacionDesempeno.js"></script>
<script type="text/javascript" src="views/js/generics/driveJexcell.js"></script>
<script type="text/javascript" src="views/js/vendor/jexcel/jexcel_dd.js"></script>
<link rel="stylesheet" href="views/js/vendor/jexcel/css/jexcel.css" />
<script type="text/javascript" src="views/js/vendor/jexcel/jsuites.js"></script>
<link rel="stylesheet" href="views/js/vendor/jexcel/css/jsuites.css" />
<script type="text/javascript" src="views/js/vendor/xlsx/jszip.js"></script>
<script type="text/javascript" src="views/js/vendor/xlsx/xlsx.js"></script>

<h5>SUBIR REPORTE DE EVALUACIÓN</h5>
<hr>
<div class="row">
  <div class="form-row" id="MsjAJX"></div>
  <form action="">
    <div class="col-md-12 mb-2">
      <h6 class="submenus">Subir archivo</h6>
      <div class="secciones">
        <div class="row padding-secciones">
          <div class="row">
            <div class="col-md-6 mb-2">
              <label class="label-form">Subir archivo</label>
              <input id="file-xlxs" type="file" class="custom-file-input form-control" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" required>
            </div>
            <div class="col-md-3 mb-2">
              <label class="label-form">Fecha de publicación</label>
              <input type="date" class="form-control input-form border-required color-t" name="fecha_publicacion" id="fecha_publicacion" required placeholder="Nombre del funcionario...">
              <div class="invalid-feedback">
                Debe seleccionar la fecha
              </div>
            </div>
            <div class="col-md">
              <button class="btn btn-otros" id="btnSubir" style="margin-top: 33px;" type="button"> <i class="fa fa-upload"></i> SUBIR</button>
            </div>
          </div>
          <hr>
          <div class="container-fluid position-cont color-form">
            <!-- <div class="form-row" id="MsjAJX"></div>
  <div id="collapseCero" class="collapse show" aria-labelledby="headingCero" data-parent="#accordion"> -->
            <!-- <center><h3 class="pdd">Saldo inicial</h3></center> -->
            <!-- <div class="custom-file">
      <input id="file-xlxs" type="file" class="custom-file-input form-control" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" required>
      <label for="file-xlxsTxt" class="custom-file-label">Escoja el archivo...</label>
      <div class="invalid-feedback">Debe adjuntar un archivo excell</div>
    </div> -->
            <div class="row">
              <div class="col-md-12">
                <div id="spreadsheet3"></div>
                <div>
                  <!-- <button id='download'>Exportar archivo en CSV</button> -->
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <label class="label-form">Nombre del archivo: <span style="font-weight: bold;" name="nombreArchivo"></span></label>
            <label class="label-form">Fecha de publicación: <span style="font-weight: bold;" name="fechaPublicacion"></span></label>
            <label class="label-form">Tamaño: <span style="font-weight: bold;" name="tamano"></span></label>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div id="spreadsheet3"></div>
        </div>
      </div>
    </div>
  </form>
</div>
<div class="container-fluid position-cont color-form">
  <!-- <div class="form-row" id="MsjAJX"></div>
  <div id="collapseCero" class="collapse show" aria-labelledby="headingCero" data-parent="#accordion"> -->
  <!-- <center><h3 class="pdd">Saldo inicial</h3></center> -->
  <!-- <div class="custom-file">
      <input id="file-xlxs" type="file" class="custom-file-input form-control" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" required>
      <label for="file-xlxsTxt" class="custom-file-label">Escoja el archivo...</label>
      <div class="invalid-feedback">Debe adjuntar un archivo excell</div>
    </div> -->
  <div class="row">
    <div class="col-md-12">
      <div id="spreadsheet3"></div>
      <div>
        <!-- <button id='download'>Exportar archivo en CSV</button> -->
      </div>
    </div>
  </div>
</div>