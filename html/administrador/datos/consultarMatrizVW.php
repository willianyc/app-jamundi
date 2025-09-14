<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/consultarMatriz.js?v=<?php echo(rand()); ?>"></script>

<h5>CONSULTAR MATRIZ</h5>
<hr>
<div class="container mt-3">
    <div class="row">
        <div class="col-md-6">
            <input type="search" class="form-control input-form color-t" id="filterTable" type="text" placeholder="Buscar..">
        </div>
        <div class="col-md-6">
            <button class="btn btn-otros m-1" id="btnNuevo" style="float:right" type="button"> <i class="fa fa-plus"></i> NUEVO</button>
            <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
            <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
            <button class="btn btn-otros m-1" id="btnBuscarAll" style="float:right" type="button"> <i class="fa fa-eye"></i> BUSCAR TODO</button>
        </div>
    </div>
    <br>
    <table class="table table-striped" id="tblMatriz">
        <thead>
            <tr>
                <th colspan="8" style="text-align:center;background-color:#333; color:#fff">MATRIZ</th>
            </tr>
            <tr class="procesos">
              <th  style="text-align:right;background-color:#e6e6e6">ABIERTOS : </th>
              <th  colspan=7 style="text-align:left;background-color:#ccc">
                <input type="text" class="form-control input-form color-t border-required" id="numAbiertos" name="numAbierto" readOnly style="background-color: #e1f3e1;">
              </th>
            </tr>
            <tr class="procesos">
              <th  style="text-align:right;background-color:#e6e6e6">EN PROCESO : </th>
              <th  colspan=7 style="text-align:left;background-color:#ccc">
                <input type="text" class="form-control input-form color-t border-required" id="numEnProcesos" name="numEnProceso" readOnly style="background-color: #e1f3e1;">
              </th>
            </tr>
            <tr class="procesos">
              <th  style="text-align:right;background-color:#e6e6e6">CERRADOS : </th>
              <th  colspan=7 style="text-align:left;background-color:#ccc">
                <input type="text" class="form-control input-form color-t border-required" id="numCerrados" name="numCerrado" readOnly style="background-color: #e1f3e1;">
              </th>
            </tr>
            <tr>
                <th scope="col">Lugar/Sede</th>
                <th scope="col">Fecha</th>
                <th scope="col">Origen de hallazgo</th>
                <th scope="col">Tipo de accion</th>
                <th scope="col">Responsable</th>
                <th scope="col">Semaforo</th>
                <th scope="col">Estado</th>
            </tr>

        </thead>
        <tbody>
        </tbody>
    </table>
</div>