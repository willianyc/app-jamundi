<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/consultarInspeccion.js"></script>

<h5>CONSULTAR INSPECCIÓN</h5>
<hr>
<div class="container mt-3">
    <div class="row">
        <!-- Majjul -->
        <div class="col-md-3">
            <input type="search" class="form-control input-form color-t" id="filterTable" type="text" placeholder="Buscar..">
        </div>
        <!-- Majjul -->
        <div class="col-md-2">
            <select class="form-control input-form color-t border-required" id="mes" required="">
                <option value="" selected disabled>Seleccione el mes...</option>
                <option value="01">ENERO</option>
                <option value="02">FEBRERO</option>
                <option value="03">MARZO</option>
                <option value="04">ABRIL</option>
                <option value="05">MAYO</option>
                <option value="06">JUNIO</option>
                <option value="07">JULIO</option>
                <option value="08">AGOSTO</option>
                <option value="09">SEPTIEMBRE</option>
                <option value="10">OCTUBRE</option>
                <option value="11">NOVIEMBRE</option>
                <option value="12">DICIEMBRE</option>
            </select>
            <div class="invalid-feedback">
                Debe seleccionar el Mes
            </div>
        </div>
        <!-- Majjul -->
        <div class="col-md-7">
            <button class="btn btn-otros m-1" id="btnNuevo" style="float:right" type="button"> <i class="fa fa-plus"></i> NUEVO</button>
            <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
            <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
            <!-- Majjul -->
            <button class="btn btn-otros m-1" id="btnReporte" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> REPORTE</button>
		<button class="btn btn-otros m-1" id="btnBuscarAll" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR TODO</button>
        </div>
    </div>
    <br>
    <table class="table table-striped" id="tblActividad">
        <thead>
            <tr>
                <th colspan="8" style="text-align:center;background-color:#e6e6e6">INSPECCIONES</th>
            </tr>
            <tr>
                <th scope="col">Identificación</th>
                <!-- <th scope="col">Nombre</th> -->
                <th scope="col">Fecha Inicio</th>
                <th scope="col">Fecha Fin</th>
                <th scope="col">Modalidad</th>
                <th scope="col">Dependencia</th>
                <th scope="col">Estado</th>
            </tr>

        </thead>
        <tbody>
        </tbody>
    </table>
    <!-- Majjul -->
    <table class="table table-striped d-none" id="tblInspeccionesReportes">
        <thead>
            <tr>
                <th colspan="5" style="text-align:center;background-color:#e6e6e6">
			<div class="d-flex justify-content-between">
			  <div>
				REPORTES
			  </div>
			  <div>
				<select class="form-control input-form color-t" id="reporteEstado">
					<option value="" disabled selected>Estado a filtrar</option>
			  		<option value="suspendido">Suspendido</option>
			  		<option value="realizado">Realizado</option>
			  		<option value="pendiente">Pendiente</option>
                    		<option value="cancelado">Cancelado</option>
					<option value="">Todos</option> 
                  	</select>
			  </div>
                  </div>
		    </th>
            </tr>
            <tr>
                <th scope="col">Identificación</th>
		    <th scope="col">Nombre</th>
		    <th scope="col">Lugar</th>
                <th scope="col">Estado</th>
		    <th scope="col">Opción</th>
            </tr>
        </thead>
	  <tbody class="d-none">
	  <tbody/>
    </table>
</div>