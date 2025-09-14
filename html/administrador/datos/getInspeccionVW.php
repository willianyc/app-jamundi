<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/consultarInspeccion.js"></script>
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
                        <tr>
                            <td scope="col"><button class="btn btn-danger btn-sm" name="limpiarFiltros"><i class="fa fa-trash-o"></i></button></td>
                            <td scope="col"><input type="text" class="form-control" id="documento" placeholder="Identificación..."></td>
                            <td scope="col"><input type="text" class="form-control" id="tipo_vinculacion" placeholder="Tipo de contrato..."></td>
                            <td scope="col"><input type="text" class="form-control" id="nivel" placeholder="Nivel..."></td>
                            <td scope="col"><input type="text" class="form-control" id="cargo" placeholder="Denominación..."></td>
                        </tr>
                        <tr>
                            <th scope="col"><input type="checkbox" name="selectedAll" id=""></th>
                            <th scope="col">Identificación</th>
                            <th scope="col">Tipo de contrato</th>
                            <th scope="col">Nivel</th>
                            <th scope="col">Denominación</th>
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
<h5>INSPECCIÓN</h5>
<hr>
<div class="row">
    <div class="form-row" id="MsjAJX" required=""></div>
    <form action="" class="mb-3">
        <div class="row">
            <div class="col-md-12 mb-2">
                <button class="btn btn-otros m-1" id="btnEliminarActividad" style="float:right" type="button"> <i class="fa fa-trash-o"></i> ELIMINAR</button>
                <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i class="fa fa-file-excel-o"></i> EXCEL</button>
                <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i class="fa fa-file-pdf-o"></i> PDF</button>
                <button class="btn btn-otros m-1" id="btnEditar" style="float:right" type="button"> <i class="fa fa-pencil"></i> EDITAR</button>
                <button class="btn btn-otros m-1 d-flex" id="btnTrazabilidad" style="float:right" type="button"><i class="fa fa-list mt-1"></i>
                    <div class="mx-1" id="trzText">VER TRAZABILIDAD</div>
                </button>
                <button class="btn btn-otros m-1" id="btnAtras" style="float:right" type="button"> <i class="fa fa-arrow-left"></i> IR ATRAS</button>
            </div>
        </div>
        <div class="row show-info-traz d-none">
            <div class="col-md-12 mb-2">
            <h6 class="submenus">Datos de la inspección</h6>
                <div class="secciones">
                <div class="row padding-secciones">
                    <div class="col-md-4 mb-2">
                        <label class="label-form" for="identificacion">Identificación <span style="color: red;">*</span></label>
                        <input type="text" class="form-control input-form color-t border-required" id="identificacionTrazabilidad" readonly>
                    </div>
                    <div class="col-md-8 mb-2">
                        <label class="label-form" for="tipoInspTrazabilidad">Tipo de inspección <span style="color: red;">*</span></label>
                        <select class="form-control input-form color-t border-required" id="tipoInspTrazabilidad">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="1">Inspeccion gerencial</option>
                                <option value="2">Inspeccion vehiculos (carro, motos, maquinaria amarilla)</option>
                                <option value="3">Inspeccion estado de elementos de proteccion personal</option>
                                <option value="4">Inspeccion uso de elementos de proteccion personal</option>
                                <option value="5">Inspeccion extintores</option>
                                <option value="6">Inspeccion botiquin</option>
                                <option value="7">Inspección camilla y férula de inmovilización de fracturas</option>
                                <option value="8">Inspeccion Herramientas y equipos</option>
                                <option value="9">Inspeccion de comportamientos inseguros</option>
                                <option value="10">Inspecciones de areas dependencias</option>
                                <option value="11">Inspeccion de riesgo quimicos</option>
                            </select>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-2 hidden-info">
            <h6 class="submenus">Inspección</h6>
            <input type="hidden" id="id_inspeccion">
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
                            <label class="label-form" for="tipo_inspeccion">Tipo de inspección <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="tipo_inspeccion" required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="1">Inspeccion gerencial</option>
                                <option value="2">Inspeccion vehiculos (carro, motos, maquinaria amarilla)</option>
                                <option value="3">Inspeccion estado de elementos de proteccion personal</option>
                                <option value="4">Inspeccion uso de elementos de proteccion personal</option>
                                <option value="5">Inspeccion extintores</option>
                                <option value="6">Inspeccion botiquin</option>
                                <option value="7">Inspección camilla y férula de inmovilización de fracturas</option>
                                <option value="8">Inspeccion Herramientas y equipos</option>
                                <option value="9">Inspeccion de comportamientos inseguros</option>
                                <option value="10">Inspecciones de areas dependencias</option>
                                <option value="11">Inspeccion de riesgo quimicos</option>
                                <option value="12">Otros...</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar el Tipo de inspección
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-2" id="divDescripcion" style="display: none;">
                            <label class="label-form" for="descripcion">Descripción <span style="color: red;">*</span></label>
                            <textarea type="text" rows="5" class="form-control input-form color-t border-required" id="descripcion" name="descripcion" placeholder="Observación..."></textarea>
                            <div class="invalid-feedback">
                                Debe ingresar descripción
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
                            <label class="label-form" for="dependencia">Area <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="dependencia" required="">
                                <option value="" selected disabled>Seleccione...</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar el area
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-2" id="content-estado">
                            <label class="label-form" for="estado">Estado</label>
                            <select class="form-control input-form color-t border-required" disabled id="estado">
                                <option value="" selected>Seleccione...</option>
                                <option value="REALIZADO">REALIZADO</option>
                                <option value="SUSPENDIDO">SUSPENDIDO</option>
                                <option value="CANCELADO">CANCELADO</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Estado
                            </div>
                        </div>
                        <!--Majjul -->
                        <div class="col-md-6 mb-2 d-none" id="content-fecha">
                            <label class="label-form" for="fecha_">Fecha</label>
                            <input type="date" class="form-control input-form color-t border-required" disabled id="fecha_" name="fecha_">
                        </div>
                        <div class="col-md-3 mb-2 content-date d-none">
                            <label class="label-form" for="fecha_inicio_suspencion">Reprogramación fecha inicio<span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t border-required" disabled id="fecha_inicio_suspencion" name="fecha_inicio_suspencion">
                        </div>
                        <div class="col-md-3 mb-2 content-date d-none">
                            <label class="label-form" for="fecha_final_suspencion">Reprogramación fecha final<span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t border-required" disabled id="fecha_final_suspencion" name="fecha_final_suspencion">
                        </div>

                        <div class="col-md-12 mb-2" id="divMotivo" style="display: none;">
                            <label class="label-form" for="motivo">Motivo</label>
                            <textarea type="text" rows="5" class="form-control input-form color-t border-required" disabled id="motivo" name="motivo" placeholder="Motivo..."></textarea>
                            <div class="invalid-feedback">
                                Debe ingresar el Motivo
                            </div>
                        </div>
                        <!-- Majjul -->
                        <div class="col-md-12 mb-2" id="divObservacion" style="display: none;">
                            <label class="label-form" for="observacion">Observación</label>
                            <textarea type="text" rows="5" class="form-control input-form color-t border-required" disabled id="observacion" name="observacion" placeholder="Observación..."></textarea>
                            <div class="invalid-feedback">
                                Debe ingresar el Observación
                            </div>
                        </div>
                    </div>
                    <div class="row"> 
                        <div class="col-md-6 mb-2 contentSedeDenominacion" style="display: block;">
                            <label class="label-form" for="AllSede">Sede <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="AllSede" required>
                                <option value="" selected disabled>Seleccione...</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar la Sede
                            </div>
                        </div>
                        <div class="col-md-6 mb-2">
                            <label class="label-form" for="entidad">Responsable <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="entidad" required="" name="entidad" placeholder="Responsable...">
                            <div class="invalid-feedback">
                                Debe ingresar el Responsable
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-2 d-none" id="bloqArchivo">
                            <label class="label-form" for="archivo">Adjuntar archivo</label>
                            <input type="file" class="form-control input-form color-t border-required" id="archivo" name="archivo" placeholder="Adjuntar archivo...">
                            <div class="invalid-feedback">
                                Debe ingresar la Adjuntar archivo
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-2 hidden-info">
            <button class="btn color-button" id="btnGuardar" required="" style="float:right" type="button"> <i class="fa fa-save"></i> GUARDAR</button>
        </div>

        <!-- Majjul -->
        <div class="col-md-12 mb-2 trazabilidad table-responsive d-none">
            <table class="table table-striped" id="trazabilidadInspecciones">
                <thead>
                    <tr>
                        <th colspan="6" style="text-align:center; background-color:#e6e6e6;">TRAZABILIDAD INSPECCIÓN</th>
                    </tr>
                    <tr>
                        </th>
                        <th scope="col">
                            Fecha actualización
                        </th>
                        <th scope="col">
                            Estado
                        </th>
                        <th scope="col">
                            Observación / Motivo
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