<!-- <script type="text/javascript" src="views/js/generics/message.js"></script>
<script type="text/javascript" src="views/js/generics/autocom.js"></script> -->
<script type="text/javascript" src="views/js/generics/alertMessage.js"></script>
<script type="text/javascript" src="views/js/administrador/datos/matriz.js?v=<?php echo (rand()); ?>"></script>

<h5>MATRIZ DE HALLAZGO</h5>
<hr>
<div class="row">
    <div class="form-row" id="MsjAJX" required=""></div>
    <form action="" class="mb-3">
        <div class="row">
            <div class="col-md-12 mb-2">
                <button class="btn btn-otros m-1" id="btnEliminarMatriz" style="float:right" type="button"> <i
                        class="fa fa-trash-o"></i> ELIMINAR</button>
                <button class="btn btn-otros m-1" id="btnExcel" style="float:right" type="button"> <i
                        class="fa fa-file-excel-o"></i> EXCEL</button>
                <button class="btn btn-otros m-1" id="btnPdf" style="float:right" type="button"> <i
                        class="fa fa-file-pdf-o"></i> PDF</button>
                <button class="btn btn-otros m-1" id="btnEditar" style="float:right" type="button"> <i
                        class="fa fa-pencil"></i> EDITAR</button>
                <!-- Majjul -->
                <button class="btn btn-otros m-1 d-flex" id="btnTrazabilidad" style="float:right" type="button"><i
                        class="fa fa-list mt-1"></i>
                    <div class="mx-1" id="trzText">VER SEGUIMIENTO</div>
                </button>
                <button class="btn btn-otros m-1" id="btnAtras" style="float:right" type="button"> <i
                        class="fa fa-arrow-left"></i> IR ATRAS</button>
            </div>
        </div>
        <div class="col-md-12 mb-2 hidden-info">
            <h6 class="submenus">Modificar matriz</h6>
            <input type="hidden" id="id_matriz">
            <div class="secciones">
                <div class="row padding-secciones">
                    <div class="row">

                        <div class="col-md-12">

                            <div class="form-inline">
                                <div class="custom-control custom-radio pr-3">
                                    <label for="is_entidad" class="label-form">¿En La Entidad?</label>
                                    <label class="custom-control-label label-form" for="si_entidad">Si</label>
                                    <input type="radio" class="custom-control-input" id="si_entidad" disabled
                                        name="is_entidad" value="1" required="">
                                    <label class="custom-control-label label-form" for="no_entidad">No</label>
                                    <input type="radio" class="custom-control-input" id="no_entidad" disabled
                                        name="is_entidad" value="0" required="">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 mb-2 contentLugar" style="display: none;">
                            <label class="label-form" for="lugar">Lugar <span style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" disabled
                                id="lugar" name="lugar" placeholder="Lugar...">
                            <div class="invalid-feedback">
                                Debe ingresar el Lugar
                            </div>
                        </div>

                        <div class="col-md-4 mb-2 contentSedeDenominacion" style="display: none;">
                            <label class="label-form" for="AllSede">Sede <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" disabled id="AllSede"
                                required="">
                                <option value="" selected disabled>Seleccione...</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar el Sede
                            </div>
                        </div>

                        <div class="col-md-4 mb-2 contentSedeDenominacion" style="display: none;">
                            <label class="label-form" for="dependencia">Dependencia <span
                                    style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" disabled id="dependencia"
                                required="">
                                <option value="" selected disabled>Seleccione...</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar la Dependencia
                            </div>
                        </div>

                        <div class="col-md-4 mb-2 contentSedeDenominacion" style="display: none;">
                            <label class="label-form" for="cargoPropiedad">Denominación <span
                                    style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" disabled id="cargoPropiedad"
                                required="">
                                <option value="0" selected disabled>Seleccione...</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar el Cargo
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <label for="fecha" class="label-form">Fecha<span style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required"
                                id="fecha" required="">
                            <div class="invalid-feedback">Debe seleccionar la fecha.</div>
                        </div>
                        <div class="col-md-8 mb-2">
                            <label class="label-form" for="origenHallazgo">Origen de hallazgo <span
                                    style="color: red;">*</span></label>
                            <!-- <input type="text" class="form-control input-form color-t border-required" id="origenHallazgo" required="" name="origenHallazgo" placeholder="Origen de hallazgo..."> -->
                            <select class="form-control input-form color-t border-required" id="origenHallazgo"
                                required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="Auditoria (interna o externa)">Auditoria (interna o externa)</option>
                                <option value="COPASST">COPASST</option>
                                <option value="Directriz Organizacional">Directriz Organizacional</option>
                                <option value="Incidentes (casi accidentes)">Incidentes (casi accidentes)</option>
                                <option value="Inspección">Inspección</option>
                                <option value="Investigación">Investigación</option>
                                <option value="Manejo del Cambio">Manejo del Cambio</option>
                                <option value="Necesidades de Equipo">Necesidades de Equipo</option>
                                <option value="Quejas y Reclamos">Quejas y Reclamos</option>
                                <option value="Reporte de Actos Y Condiciones Inseguras">Reporte de Actos Y Condiciones
                                    Inseguras</option>
                                <option value="Revisión de Proceso">Revisión de Proceso</option>
                                <option value="Otro">Otro</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar el Origen de hallazgo
                            </div>
                        </div>
                        <div class="col-md-12 mb-2">
                            <label for="descripcionHallazgo" class="label-form">Descripcion de Hallazgo <span
                                    style="color: red;">*</span></label>
                            <textarea class="form-control input-form color-t" id="descripcionHallazgo"
                                placeholder="Descripcion de hallazgo..." name="descripcionHallazgo" rows="5"
                                maxlength="250" required></textarea>
                            <div class="invalid-feedback">Debe ingresar la Descripcion de hallazgo</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 mb-2">
                            <label class="label-form" for="elementoSiguiente">Elemento sig que interviene <span
                                    style="color: red;">*</span></label>
                            <!-- <input type="text" class="form-control input-form color-t border-required" id="elementoSiguiente" required="" name="elementoSiguiente" placeholder="Elemento sig que interviene..."> -->
                            <select class="form-control input-form color-t border-required" id="elementoSiguiente"
                                required="">
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="Liderazgo y Cultura Organizacional">Liderazgo y Cultura Organizacional
                                </option>
                                <option value="Cumplimiento de Requisitos y Estándares">Cumplimiento de Requisitos y
                                    Estándares</option>
                                <option value="Participación y comunicación con partes interesadas">Participación y
                                    comunicación con partes interesadas</option>
                                <option value="Manejo de información y Documentación">Manejo de información y
                                    Documentación</option>
                                <option value="Identificación de Peligros, Análisis de Riesgos y Controles">
                                    Identificación de Peligros, Análisis de Riesgos y Controles</option>
                                <option value="Estructura y Responsabilidad">Estructura y Responsabilidad</option>
                                <option value="Aseguramiento de Competencias">Aseguramiento de Competencias</option>
                                <option value="Integridad de Activos y Confiabilidad">Integridad de Activos y
                                    Confiabilidad</option>
                                <option value="Procedimientos y Prácticas de Trabajo Seguro">Procedimientos y Prácticas
                                    de Trabajo Seguro</option>
                                <option value="Manejo del Cambio ">Manejo del Cambio </option>
                                <option value="Aseguramiento de Contratistas y Proveedores">Aseguramiento de
                                    Contratistas y Proveedores</option>
                                <option value="Manejo de Emergencias">Manejo de Emergencias</option>
                                <option value="Investigación de Incidentes">Investigación de Incidentes</option>
                                <option value="Medición y monitoreo">Medición y monitoreo</option>
                                <option value="Auditorias">Auditorias</option>
                                <option value="Revisión gerencial">Revisión gerencial</option>
                                <option value="Investigación de Accidentes">Investigación de Accidentes</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar el Elemento que interviene
                            </div>
                        </div>
                        <div class="col-md-12 mb-2">
                            <label class="label-form" for="recomendacion">Recomendación <span
                                    style="color: red;">*</span></label>
                            <!-- <input type="text" class="form-control input-form color-t border-required" id="recomendacion" required name="recomendacion" placeholder="Recomendación..."> -->
                            <textarea class="form-control input-form color-t" id="recomendacion"
                                placeholder="Recomendacion..." name="recomendacion" rows="5" maxlength="250"></textarea>
                            <div class="invalid-feedback">
                                Debe ingresar el Recomendación
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-2 hidden-info">
            <div class="submenus p-2 d-flex justify-content-between">
                <h6 class="">Seguimiento</h6>
                <button type="button" class="btn btn-otros" style="margin-top: 0px;" id="newTrazabilidad">
                    + NUEVO SEGUIMIENTO
                </button>
            </div>
            <div class="seccionesSeguimiento" style="border: 1px solid gray;">
                <div class="row padding-secciones">
                    <div class="row">
                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="tipoAccion">Tipo De Acción <span
                                    style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="tipoAccion" required>
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="A. Correctiva">A. Correctiva</option>
                                <option value="A. De mejora">A. De mejora</option>
                                <option value="A. Preventiva">A. Preventiva</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar la Tipo de acción
                            </div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="responsable">Responsable <span
                                    style="color: red;">*</span></label>
                            <input type="text" class="form-control input-form color-t border-required" id="responsable"
                                required="" name="responsable" placeholder="Responsable...">
                            <div class="invalid-feedback">
                                Debe ingresar el Responsable
                            </div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <label for="fechaPropuestaCierre" class="label-form">Fecha Propuesta De Cierre<span
                                    style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required"
                                id="fechaPropuestaCierre" required>
                            <div class="invalid-feedback">Debe seleccionar la Fecha propuesta de cierre.</div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-12 mb-2">
                            <label class="label-form" for="accionTomada">Accion Tomada <span
                                    style="color: red;">*</span></label>
                            <textarea class="form-control input-form color-t" id="accionTomada"
                                required="" name="accionTomada" placeholder="Accion tomada..." rows="3" maxlength="250"></textarea>
                            <div class="invalid-feedback">
                                Debe ingresar el Accion tomada
                            </div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="estado">Estado <span style="color: red;">*</span></label>
                            <select class="form-control input-form color-t border-required" id="estado" required>
                                <option value="" selected disabled>Seleccione...</option>
                                <option value="ABIERTO" selected>ABIERTO</option>
                                <option value="CERRADO">CERRADO</option>
                                <option value="EN PROCESO">EN PROCESO</option>
                            </select>
                            <div class="invalid-feedback">
                                Debe ingresar el Estado
                            </div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <label for="fechaSeguimiento" class="label-form">Fecha Seguimiento<span
                                    style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required"
                                id="fechaSeguimiento" required>
                            <div class="invalid-feedback">Debe seleccionar la Fecha de Seguimiento.</div>
                        </div>

                        <div class="col-md-4 mb-2">
                            <label class="label-form" for="avance">Avance(%) <span style="color: red;">*</span></label>
                            <input type="number" class="form-control input-form color-t border-required" id="avance"
                                name="avance" min="1" max="99" placeholder="Avance(%)..." value="0" required>
                            <div class="invalid-feedback">Debe ingresar el avance</div>
                        </div>

                        <div class="col-md-12 mb-2 contentFechaCierre" style="display: none;">
                            <label for="fechaCierre" class="label-form">Fecha de cierre<span
                                    style="color: red;">*</span></label>
                            <input type="date" class="form-control input-form color-t disabled border-required"
                                id="fechaCierre" required>
                            <div class="invalid-feedback">Debe seleccionar la Fecha de cierre.</div>
                        </div>


                        <div class="col-md-12 mb-2 d-none" id="bloqArchivo">
                            <label class="label-form" for="archivo">Documento soporte</label>
                            <input type="file" class="form-control input-form color-t border-required" id="archivo"
                                name="archivo" placeholder="Documento soporte...">
                            <div class="invalid-feedback">
                                Debe ingresar la Documento soporte
                            </div>
                        </div>
                        <div class="col-md-12 mb-2 hidden-info">
                            <button class="btn color-button" id="btnGuardarTrazabilidad" required="" style="float:right; display: none;"
                                type="button"> <i class="fa fa-save"></i> GUARDAR SEGUIMIENTO</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-2 hidden-info">
            <button class="btn color-button" id="btnGuardar" required="" style="float:right" type="button"> <i
                    class="fa fa-save"></i> GUARDAR</button>
        </div>

        <!-- Majjul -->
        <div class="col-md-12 mb-2 trazabilidad table-responsive d-none">
            <table class="table table-striped" id="trazabilidadMatriz">
                <thead>
                    <tr>
                        <th colspan="9" style="text-align:center; background-color:#e6e6e6;">TRAZABILIDAD MATRIZ DE HALLAZGO</th>
                    </tr>
                    <tr>
                        <th scope="col">
                            Fecha actualización
                        </th>
                        <th scope="col">
                            Estado
                        </th>
                        <th scope="col">
                            Tipo Acción
                        </th>
                        <th scope="col">
                            Responsable
                        </th>
                        <th scope="col">
                            Fecha propuesta cierre
                        </th>
                        <th scope="col">
                            Acción tomada
                        </th>
                        <th scope="col">
                            Fecha de cierre
                        </th>
                        <th scope="col">
                            Fecha de seguimiento
                        </th>
                        <th scope="col">
                            Avance
                        </th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </form>