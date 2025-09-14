<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<!--<script type="text/javascript" src="views/js/plugins/chartjs.min.js"></script> -->
<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/participacionenCapacitaciones.js"></script>

<h5>FUNCIONARIOS QUE PARTICIPARÓN EN CAPACITACIONES</h5>
<hr>
<div class="container mt-3">
  <div class="row">
    <div class="form-row" id="MsjAJX"></div>
    <div class="col-md-3">
      <label for="fecha_nac" class="label-form">Rango de Fecha Inicial<span style="color: red;">*</span></label>
      <input type="date" class="form-control input-form color-t disabled border-required" id="fecha_ini" required="">
      <div class="invalid-feedback">Debe seleccionar la fecha.</div>
    </div>
    <div class="col-md-3">
      <label for="fecha_nac" class="label-form">Rango de Fecha Final <span style="color: red;">*</span></label>
      <input type="date" class="form-control input-form color-t disabled border-required" id="fecha_fin" required="">
      <div class="invalid-feedback">Debe seleccionar la fecha.</div>
    </div>

    
     <div class="col-md-4"> 
        <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button" target="_blank"> <i class="fa fa-file-pdf-o"></i> PDF</button>
        <button class="btn btn-otros m-1" id="excel-btn" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
        <button class="btn btn-otros m-1" id="btnBuscar" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR</button>
        
      </div>

    
  </div>
  <br>
  <table class="table table-striped" id="tblRankinCapacitaciones">
    <thead>
      <tr>
        <th colspan="8" style="text-align:center;background-color:#e6e6e6">PARTICIPACION EN CAPACITACIONES</th>
      </tr>
      <tr>
        <th scope="col">Identificacion</th>
        <th scope="col">Nombre</th>      
        <th scope="col">Participacion</th>
       
      </tr>

    </thead>
    <tbody>
    </tbody>
  </table>
  
</div>
