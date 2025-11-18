/*Formatea el numero a tipo moneda*/
function formatCurrency(numero){
  if(null == numero) return 0;
  var amount = parseFloat(parseFloat(numero).toFixed(2));
  return amount.toLocaleString('de-DE');
}
/*revertimos valor en moneda a tipo numero */
function formatCurrencyRevert(price){
  price = price.replace(/[^0-9-,]/g, '');
  price = Number(price.replace(/[,]/g, '.'));
  return price;
}
// Toma una fecha en string formato (AAAA-MM-DD)
// y le suma la cantidad de dias que se desee, devolviendo un string
function addDaysString(fecha,days) {
  var dat = new Date();
  fecha = fecha.split("-");
  dat.setFullYear(fecha[0],fecha[1]-1,fecha[2]);
  dat.setDate(dat.getDate() + days);
  return dat.yyyymmdd();
}
// Adiciona un funcion a el objeto Date  que transforma la feha
// en un string con el formato (AAAA-MM-DD)
Date.prototype.yyyymmdd = function() {
  var mm = this.getMonth() + 1; // getMonth() is zero-based
  var dd = this.getDate();

  return [this.getFullYear(),
          (mm>9 ? '' : '0') + mm,
          (dd>9 ? '' : '0') + dd
         ].join('-');
};
// Formatea numero float con la cantidad de coma flotante deseada
function formatFloat(number,decimales){
  return parseFloat(number).toFixed(decimales).replace(/\.?0*$/,'');
}//