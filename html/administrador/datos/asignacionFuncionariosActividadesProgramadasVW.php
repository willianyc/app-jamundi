<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/asignacionFuncionariosActividadesProgramadas.js?v=<?php echo(rand()); ?>"></script>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="max-width: 70%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Funcionarios</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped" id="tbl_funcionarios" style="display: block;overflow: auto;height: 350px;">
                    <thead>
                        <!-- Majjul -->
                        <!--
                        <tr>
                            <td scope="col"><button class="btn btn-danger btn-sm" name="limpiarFiltros"><i class="fa fa-trash-o"></i></button></td>
                            <td scope="col"><input type="text" class="form-control" id="documento" placeholder="Identificación..."></td>
                            <td scope="col"><input type="text" class="form-control" id="codigo" placeholder="Código..."></td>
                            <td scope="col"><input type="text" class="form-control" id="cargo" placeholder="Denominación..."></td>
                            <td scope="col"><input type="text" class="form-control" id="sede" placeholder="Séde..."></td>
                        </tr>
				        -->
                        <!--Majjul -->
                        <tr>
                            <td><button class="btn btn-danger btn-sm" name="limpiarFiltros"><i class="fa fa-trash-o"></i></button></td>
                            <td><input type="text" id="searchByIdentification" class="form-control" placeholder="Identificación..."></td>
                            <td><input type="text" id="searchByName" class="form-control" placeholder="Nombre..."></td>
                            <td><input type="text" id="searchByLastName" class="form-control" placeholder="Apellido..."></td>
                            <td><input type="text" id="searchByCode" class="form-control" placeholder="Código..."></td>
                            <td><input type="text" id="searchByPosition" class="form-control" placeholder="Cargo..."></td>
                            <td><input type="text" id="searchByCampus" class="form-control" placeholder="Séde..."></td>
                        </tr>
                        <tr>
                            <th scope="col"><input type="checkbox" name="selectedAll" id=""></th>
                            <th scope="col">Identificación</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Código</th>
                            <th scope="col">Denominación</th>
                            <th scope="col">Séde</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
                <button type="button" class="btn btn-primary" name="mdlAceptar" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>
<h5>DETALLES DE LA ACTIVIDAD PROGRAMADA</h5>
<hr>
<div class="row">
    <div class="form-row" id="MsjAJX"></div>
    <form action="" class="mb-3">
        <div class="row">
            <div class="col-md-12 mb-2">
                <button class="btn btn-otros m-1" id="btnEliminarActividad" style="float:right" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>
                <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
                <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
                <button class="btn btn-otros m-1" id="btnEditar" style="float:right" type="button"> <i class="fa fa-pencil"></i> EDITAR</button>
                <!-- Majjul -->
                <button class="btn btn-otros m-1 d-flex" id="btnTrazabilidad" style="float:right" type="button"><i class="fa fa-list mt-1"></i> <div class="mx-1" id="trzText">VER TRAZABILIDAD</div></button>
                <button class="btn btn-otros m-1" id="btnAtras" style="float:right" type="button"><i class="fa fa-arrow-left"></i> IR ATRAS</button>
            </div>
        </div>
        <div class="row show-info-traz d-none">
            <div class="col-md-12 mb-2">
            <h6 class="submenus">Datos de la actividad</h6>
                <div class="secciones">
                <div class="row padding-secciones">
                    <div class="col-md-4 mb-2">
                        <label class="label-form" for="identificacion">Identificación <span style="color: red;">*</span></label>
                        <input type="text" class="form-control input-form color-t border-required" id="identificacionTrazabilidad" readonly>
                    </div>
                    <div class="col-md-8 mb-2">
                        <label class="label-form" for="nombre">Nombre <span style="color: red;">*</span></label>
                        <input type="text" class="form-control input-form color-t border-required" id="nombreTrazabilidad" readonly>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <!--Majjul-->
        <div class="col-md-12 mb-2 hidden-info">
            <h6 class="submenus">Datos de la actividad</h6>
            <input type="hidden" id="id_actividad">
            <div class="secciones">
                <div class="row padding-secciones">
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="identificacion">Identificación <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="identificacion" required="" name="identificacion" placeholder="Identificacion...">
                            <div class="invalid-feedback">
                                Debe ingresar la Identificación
                            </div>
                        </div>
                        <div class="col-md-8 mb-2">
                            <label class="label-form" for="nombre">Nombre <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="nombre" required="" name="nombre" placeholder="Nombre...">
                            <div class="invalid-feedback">
                                Debe ingresar el Nombre
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="ciclo">Ciclo <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="ciclo" required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="PLANEAR">PLANEAR</option>
                                <option value="HACER">HACER</option>
                                <option value="VERIFICAR">VERIFICAR</option>
                                <option value="ACTUAR">ACTUAR</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Ciclo
                            </div>
                        </div>
                        <div class="col-md-4 mb-2" id="bloqRecurso">
                            <label class="label-form" for="recursos">Recursos <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="recursos" required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="ADMINISTRATIVO">ADMINISTRATIVO</option>
                                <option value="FINANCIERO">FINANCIERO</option>
                                <option value="AMBOS">AMBOS</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Recursos
                            </div>
                        </div>
                        <div class="col-md-4 mb-2" style="display: block;" id="divValorTotal">
                            <label class="label-form" for="valorTotal">Valor total <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="valorTotal" name="valorTotal" placeholder="Valor total...">
                            <div class="invalid-feedback">
                                Debe ingresar el Valor total
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <label for="fecha_inicio" class="label-form">Fecha de inicio <span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required" id="fecha_inicio" required="">
                            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label for="fecha_finalizacion" class="label-form">Fecha de finalización <span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required" id="fecha_finalizacion" required="">
                            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="modalidad">Modalidad <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="modalidad" required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="PRESENCIAL">PRESENCIAL</option>
                                <option value="VIRTUAL">VIRTUAL</option>
                                <option value="MIXTA">MIXTA</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Modalidad
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="direccion">Lugar <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="direccion" required="" name="direccion" placeholder="Lugar...">
                            <div class="invalid-feedback">
                                Debe ingresar el Lugar
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="entidad">Responsable de la actividad <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="entidad" required="" name="entidad" placeholder="Responsable de la actividad...">
                            <div class="invalid-feedback">
                                Debe ingresar el Responsable de la actividad
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="estado">Estado</label>
                            <select class="form-control input-form color-t border-required" disabled id="estado">
                                <option value="PENDIENTE" selected>Seleccione...</option>
                                <option value="REALIZADO">REALIZADO</option>
                                <option value="SUSPENDIDO">SUSPENDIDO</option>
                                <option value="CANCELADO">CANCELADO</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Estado
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="col-md-12 mb-2" id="divObservacion" style="display: none;">
                            <label class="label-form" for="observacion">Observación</label>
                            <textarea type="text" rows="5" class="form-control input-form color-t border-required" disabled id="observacion" name="observacion" placeholder="Observación..."></textarea>
                            <div class="invalid-feedback">
                                Debe ingresar el Observación
                            </div>
                        </div>
                    </div>
			  <!-- Majjull -->
                    <div class="row d-none" id="content-date">
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="fecha_inicio_suspencion">Reprogramación fecha inicio <span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t border-required" disabled id="fecha_inicio_suspencion" name="fecha_inicio_suspencion">
                        </div>
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="fecha_final_suspencion">Reprogramación fecha final<span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t border-required" disabled id="fecha_final_suspencion" name="fecha_final_suspencion">
                        </div>
                    </div>
                    <div class="row">
                        <!-- Majjul -->
                        <!-- <div class="col-md-6 mb-2 d-none" id="content-fecha">
                            <label class="label-form" for="fecha_">Fecha</label>
                            <input type="date" class="form-control input-form color-t border-required" disabled id="fecha_" name="fecha_">
                        </div> -->
                        <div class="col-md-12 mb-2 d-none" id="bloqArchivo">
                            <label class="label-form" for="archivo">Adjuntar archivo</label>
                            <input type="file" class="form-control input-form color-t border-required" disabled id="archivo" name="archivo" placeholder="Adjuntar archivo...">
                            <div class="invalid-feedback">
                                Debe ingresar la Adjuntar archivo
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Majjul-->
        <div class="col-md-12 mb-2 hidden-info" style="display: none;" id="divAsignacionFuncionarios">
            <h6 class="submenus">Asignación</h6>
            <input type="hidden" id="id_seguridadsocial">
            <div class="secciones">
                <div class="row padding-secciones">
                    <div class="row">
                        <div class="col-md-6 pl-0">
                            <button type="button" id="btnBuscarFuncionarios" class="btn btn-otros" data-toggle="modal" disabled data-target="#exampleModal"><i class="fa fa-user"></i> ASIGNAR FUNCIONARIO</button>
                        </div>
                        <div class="col-md-4 mb-2">
                            <label for="fecha_asignacion" class="label-form">Fecha de asignación</label>
                            <input type="date" class="form-control input-form color-t disabled border-required" disabled id="fecha_asignacion">
                            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                        </div>
                    </div>
                    <div class="form-row">
                        <table class="table table-striped" id="tblAsignarFuncionarios">
                            <thead>
                                <tr>
                                    <th colspan="8" style="text-align:center;background-color:#e6e6e6">FUNCIONARIOS ASIGNADOS</th>
                                </tr>
                                <tr>
                                    <th scope="col">Identificación</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col" style="width: 8%;">Apellidos</th>
                                    <!-- <th scope="col">T. Contratación</th>
                                    <th scope="col">Nivel</th> -->
                                    <th scope="col">Denominación</th>
                                    <th scope="col" style="width: 10%;">Séde</th>
                                    <th scope="col">Eliminar</th>
                                </tr>

                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--Majjul-->
        <div class="col-md-12 mb-2 hidden-info">
            <button class="btn color-button" disabled id="btnGuardar" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
        </div>

        <!-- Majjul -->
        <div class="col-md-12 mb-2 trazabilidad table-responsive d-none">
            <table class="table table-striped" id="trazabilidadActividadesProgramadas">
                <thead>
                    <tr>
                        <th colspan="6" style="text-align:center; background-color:#e6e6e6;">TRAZABILIDAD ACTIVIDAD PROGRAMADA</th>
                    </tr>
                    <tr>
                        <th scope="col">
                            Fecha actualización
                        </th>
                        <th scope="col">
                            Estado
                        </th>
                        <th scope="col">
                            Observación / Motivo
                        </th>
                        <th scope="col">
                            Reprogramación inicio
                        </th>
                        <th scope="col">
                            Reprogramación final
                        </th>
                        <!-- <th scope="col">
                            Fecha cierre
                        </th> -->
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </form>