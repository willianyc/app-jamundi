class DriveTableExcell {
  constructor() {
    this.selTable = 'table.jexcel';
    this.selTbodyRows = 'tbody';

    this.jqTable = $(this.selTable);
    this.jqTbodyRows = $(this.selTable + ' ' + this.selTbodyRows);
  }

  getHeader(title = null) {
    let num = 1;
    let row = this.getRow(num)
    let header = row.map(function (n) {
      return $(this).html()
    })
    header.indexOf = function (val) {
      for (let i in this) {
        if (this[i] == val)
          return i
      }
      return false;
    }
    return !title ?
      header :
      header.indexOf(title);
  }

  getRow(number) {
    let index = number - 1;
    return this.jqTbodyRows.find(`tr[data-y=${index}] td[data-x]`)
  }

  getNumRows() {
    return this.jqTbodyRows.find('tr').length
  }

  getXYCelda(jqCelda, x = null) {
    return x == null ? {
      'x': $(jqCelda.first()).attr('data-x'),
      'y': $(jqCelda.first()).attr('data-y'),
    } : x == true ? {
      'x': $(jqCelda.first()).attr('data-x'),
    } : {
      'y': $(jqCelda.first()).attr('data-y'),
    }
  }

  getColumn(jqCelda) {
    let posXY = this.getXYCelda(jqCelda)
    return $('td[data-x=' + posXY['x'] + ']')
  }

  getObjTable() {
    let time = (new Date()).getTime()
    console.log(`# Creando objeto getObjTable ${time}`);
    let numRows = this.getNumRows()
    let header = this.getHeader()
    let objTable = Array()
    let funGetXYCelda = this.getXYCelda

    for (let index = 1; index < numRows; index++) {
      let jqRowTd = this.getRow(index + 1)
      if (this._ignoreRowSend(jqRowTd))
        continue
      let objRow = {}
      jqRowTd.each(function () {
        let posX = funGetXYCelda($(this), true)['x']
        objRow[header[posX]] = $(this).html();
      })
      objRow['_NO_ROW_EXCELL_'] = index
      objTable.push(objRow)
    }
    time = (new Date()).getTime()
    console.log(`# Creando objeto getObjTable - FIN ${time}`);
    return objTable
  }

  _ignoreRowSend(jqRowTd) {
    return jqRowTd.parents('tr').find('td.jexcel_row .estado-row i.fa-check-circle').length
  }

  getJqTrNoRowExcell(no){
    return $('tr[data-y=' + no + ']')
  }
  getJqTdNoRowExcell(no){
    return $('td.jexcel_row[data-y=' + no + ']')
  }
  getJqTdFirstField(no){
    return this.getJqTrNoRowExcell(no).find('td[data-x=0]')
  }

  getCeldaInX(x, val) {
    return $('td[data-x=' + x + ']').filter(function () {
      return $(this).html().toUpperCase() === val.toUpperCase()
    })
  }
}


class ValidateCeldaExcell extends DriveTableExcell {
  constructor(jqCelda = null) {
    super()
    this._jqCelda = jqCelda;
    this.valCelda = jqCelda == null ? null : jqCelda.html();
    this.jqColumn = null
    this.columnCompare = {}

    this.createStyle()
  }

  createStyle() {
    if (!this.jqTable.hasClass('validarTableExcell')) {
      $(`<style type='text/css'>
          .vte-invalid-number{
            background-color : #3F51B5;
            color: #FFF;
          }
          .vte-invalid-number.highlight{
            color: #5F5F5F;
          }
          td.vte-duplicate{
            background-color : red;
            color: #FFF;
          }
          td.vte-duplicate.highlight{
            color: #5F5F5F;
          }
          td.vte-mitadnuevo{
            background-color : darksalmon;
          }
          .vte-less-than{
            background-color : yellow;
          }
          .vte-inexistente{
            background-color : darkmagenta;
            color: #FFF;
          }
          .highlight.vte-inexistente{
            color: #5F5F5F;
          }
          .vte-existente{
            background-color : aqua;
          }
          .vte-nueva{
            background-color : #8bc34a;
          }
          .vte-vacio{
            background-color : #000000;
            color: #FFF;
          }
          .highlight.vte-vacio{
            color: #5F5F5F;
          }
          .vte-otro{
            background: dimgray;
            color: white;
          }
          .highlight.vte-otro{
            color: #5F5F5F;
          }
          
          #significado table.table-significado{
            background-color: #00000000
          }
          </style>`).appendTo("head");
      this.jqTable.addClass('validarTableExcell')
    }
  }

  addCeroToEmpty() {
    if (this.valCelda == '') {
      this.valCelda = 0
      this._jqCelda.html(0)
    }
  }

  addTextToEmpty(text) {
    if (this.valCelda == '') {
      this.valCelda = text
      this._jqCelda.html(text)
    }
  }

  validateInParams(params) {
    // this._jqCelda.tooltip('disable')
    let hasValidacion = false
    for (const validar of params.validar) {
      if (typeof (validar) == "object") {
        if ('regex' in validar && this.valCelda.match(validar.regex) != null) {
          hasValidacion = true
          break
        } else if ('text' in validar && this.valCelda == validar.text) {
          hasValidacion = true
          break
        }
      }
    }
    if (!hasValidacion) {
      let jqElement = this._jqCelda.addClass('vte-otro')
      this.setMsgTooltip(jqElement, params.idClass, params.msgError)
    }
  }

  validateCurrency() {
    if (isNaN(Number(this.valCelda))) {
      this._jqCelda.addClass('vte-invalid-number')
    }
  }

  validateDuplicateValue() {
    var len = this.jqColumn.length,
      out = {},
      counts = {};

    for (var i = 0; i < len; i++) {
      var item = $(this.jqColumn[i]).html();
      counts[item] = counts[item] >= 1 ? counts[item] + 1 : 1;
      if (counts[item] >= 2) {
        $(this.jqColumn[i]).addClass('vte-duplicate')
        if(out[item] == undefined)
          out[item] = [i];
        else
         out[item].push(i);
      }
    }

    console.log(`## Se Valido si es duplicado : ${out}`)
    return out;
  }

  validateDistinctValue(params) {
    var len = this.jqColumn.length

    if(len>1){
      var valIni = $(this.jqColumn[2]).html();
    }
    for (var i = 2; i < len; i++) {
      let item = $(this.jqColumn[i]).html();
      if(valIni!=item){
        let jqElement = $(this.jqColumn[i])
        jqElement.addClass('vte-otro')
        this.setMsgTooltip(jqElement, params.idClass, params.msgError)
      }
    }
  }

  validateLessThan(params) {
    if (this.columnCompare == undefined || this.columnCompare['title'] != params[0]) {
      // Calculamos la posicion de la columna a comparar si no existe
      this.columnCompare['title'] = params[0]

      let header = this.getHeader()
      let iTitle = header.indexOf(this.columnCompare['title'])
      this.columnCompare['x'] = iTitle
    }

    let posXY = this.getXYCelda(this._jqCelda)
    let jqCeldaCompare = $(`td[data-x=${this.columnCompare['x']}][data-y=${posXY['y']}]`)

    if (Number(this.valCelda) < Number(jqCeldaCompare.html())) {
      this._jqCelda.addClass('vte-less-than')
      jqCeldaCompare.addClass('vte-less-than')
    }
  }

  setMsgTooltip(jqElement,idClass, msg) {
    jqElement.addClass(`vte-fn-${idClass}`)
    jqElement = $(`.vte-fn-${idClass}`)
    jqElement.tooltip({
      title: msg
    })
    jqElement.tooltip('enable')
  }

  set jqCelda(jqCelda) {
    this._jqCelda = jqCelda;
    this.valCelda = jqCelda.html()
  }

  filterTrim() {
    this._jqCelda.html(this._jqCelda.html().trim())
  }

  validateNew() {

    let objTable = this.getObjTable()
    let time = (new Date()).getTime()
    console.log(`# Creando objeto packTosend ${time}`);
    let objPackToSend = (new packTosend(objTable)).get()
    time = (new Date()).getTime()
    console.log(`# Creando objeto packTosend - FIN ${time}`);
    return objPackToSend
  }
}

class packTosend {
  constructor(productos, size = 9000) {
    this.productos = productos
    this.size = size
    this.bytes = 0;
  }

  get() {
    var cantXpack = this.getCanXPack(this.productos)
    return this.chunkObj(this.productos, cantXpack)
  }

  randomProperty(obj) {
    var keys = Object.keys(obj)
    return obj[keys[keys.length * Math.random() << 0]];
  }

  getCanXPack(obj) {
    let numMuestra = Math.ceil(Object.keys(obj).length * 0.1)
    let maxSize = 0
    for (var i = 0; i < numMuestra; i++) {
      let randProperty = this.randomProperty(obj)
      let sizeRam = this.memorySizeOf(randProperty)
      if (sizeRam > maxSize) maxSize = sizeRam
    }
    let cantXpack = Math.ceil((this.size / maxSize) * 0.6)
    return cantXpack
  }

  chunkObj(object, cantXpack) {
    var values = Object.values(object);
    var final = [];
    var counter = 0;
    var portion = {};

    for (var key in object) {
      if (counter !== 0 && counter % cantXpack === 0) {
        final.push(portion);
        portion = {};
      }
      portion[key] = values[counter];
      counter++
    }
    final.push(portion);

    return final
  }

  memorySizeOf(obj, nuevo = true) {
    if (nuevo) {
      this.bytes = 0
    }
    if (obj !== null && obj !== undefined) {
      switch (typeof obj) {
        case 'number':
          this.bytes += 8;
          break;
        case 'string':
          this.bytes += obj.length * 2;
          break;
        case 'boolean':
          this.bytes += 4;
          break;
        case 'object':
          var objClass = Object.prototype.toString.call(obj).slice(8, -1);
          if (objClass === 'Object' || objClass === 'Array') {
            for (var key in obj) {
              if (!obj.hasOwnProperty(key)) continue;
              this.memorySizeOf(obj[key], false);
            }
          } else this.bytes += obj.toString().length * 2;
          break;
      }
    }
    return this.bytes;
  }
}//