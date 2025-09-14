<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/rankingFuncionariosCapacitacion.js"></script>

<h5>RANKING EN CAPACITACIONES</h5>
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
      <button type="button" id="btnBuscar" class="btn btn-otros m-1"><i class="fa fa-eye"></i> BUSCAR</button>
      <button type="button" id="excel-btn" class="btn btn-otros m-1"><i class="fa fa-file-excel-o"></i> EXCEL</button>
      <button type="button" id="btnPdf" class="btn btn-otros m-1"><i class="fa fa-file-pdf-o"></i> PDF</button>
 
    </div>
  </div>
    
    <br>
    <table class="table table-striped" id="tblRankinCapacitaciones">
        <thead>
            <tr>
                <th colspan="8" style="text-align:center;background-color:#e6e6e6">RANKING DE FUNCIONARIOS DE PARTICIPACIÓN EN CAPACITACIONES</th>
            </tr>
            <tr>
                
                <th scope="col">Documento</th>
                <th scope="col">Nombre</th>                
                <th scope="col">Cant. Participaciones</th>
                <th scope="col">Participaciones</th>
            </tr>

        </thead>
        <tbody>
        </tbody>
    </table>
</div>