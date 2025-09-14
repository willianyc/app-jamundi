<h5>CONSULTA DE CUMPLEAÑOS DE FUNCIONARIOS </h5>
<hr>
<div class="form-row" id="MsjAJX"></div><br>
<div class="container mt-3">
  <!-- <h2>Filterable Table</h2>
  <p>Type something in the input field to search the table for first names, 
  last names or emails:</p>   -->
  <div class="row">
    <div class="col-md-12 row">
      <div class="col-md-6 row">
        
        <div class="col-md-6">
          <label for="">Mes inicial</label>
          <!-- <input class="form-control input-form color-t" id="fecha_ini" type="date" placeholder="Buscar..">-->
		  <select class="form-control input-form color-t border-required desactivar" id="fecha_ini">
          <option value="1">Enero</option>
          <option value="2">Febrero</option>
          <option value="3">Marzo</option>
          <option value="4">Abril</option>
		  <option value="5">Mayo</option>
          <option value="6">Junio</option>
		  <option value="7">Julio</option>
          <option value="8">Agosto</option>
          <option value="9">Septiembre</option>
          <option value="10">Octubre</option>
		  <option value="11">Noviembre</option>
          <option value="12">Diciembre</option>
		 </select>		  
        </div>
        <div class="col-md-6">
          <label>Mes final</label>
         <!-- <input class="form-control input-form color-t" id="fecha_fin" type="date" placeholder="Buscar.."> -->
		   <select class="form-control input-form color-t border-required desactivar" id="fecha_fin">
          <option value="1">Enero</option>
          <option value="2">Febrero</option>
          <option value="3">Marzo</option>
          <option value="4">Abril</option>
		  <option value="5">Mayo</option>
          <option value="6">Junio</option>
		  <option value="7">Julio</option>
          <option value="8">Agosto</option>
          <option value="9">Septiembre</option>
          <option value="10">Octubre</option>
		  <option value="11">Noviembre</option>
          <option value="12">Diciembre</option>
		 </select>		 
        </div>
        
      </div>
      <div class="col-md-4">
        <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
        <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
        <button class="btn btn-otros m-1" id="buscar" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR</button>
      </div>
    </div>
  </div>
  <br>
  <table class="table table-striped" id="tblCapacitaciones">
    <thead>
      <tr>
        <th colspan="8" style="text-align:center;background-color:#e6e6e6">FUNCIONARIOS</th>
      </tr>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Identificación</th>
        <th scope="col">Nombre</th>
        <th scope="col">nivel</th>
        <th scope="col">Dia</th>
		<th scope="col">Mes</th>
		<th scope="col">Año</th>
        <th scope="col">Edad</th>
       
      </tr>

    </thead>
    <tbody>
    </tbody>
  </table>
</div>
</div>
<script type="text/javascript" src="views/js/administrador/datos/consultarFuncionarioFechaCumpleanos.js"></script>