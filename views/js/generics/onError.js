// ##### Controlador de Errores 
function captureError(ex,exBrowser) {
  $.post('v2/logger/js/', {
    data : {
      name: ex.name, // e.g. ReferenceError
      message: ex.message, // e.g. x is undefined
      url: document.location.href,
      file: ex.file,
      line : ex.line,
      col : ex.col,
      exBrowser : exBrowser
    }
  });
}

// Verificamos si hay algun error nuevo que deba ser revisado
function isThrowNew(msg,line,file,url){
  // Añadimos las excepciones.
  for(var val of [
      // Estos son errores identificados de los navegadores
      "undefined is not an object (evaluating '__firefox__.metadata.extractMetadata')",
      "null is not an object (evaluating 'elt.parentNode')"
    ]){
    if(msg.includes(val))
      return 0
  };

  // Este error es por los navegadores, que injectan codigo en él
  if(Number(line)<2 && file==url)
    return 1
  return 2 //Error normal del codigo
}

window.onerror = function(msg, file, line, col, error) {
  // Note that col & error are new to the HTML 5 spec and may not be 
  // supported in every browser.  It worked for me in Chrome.
  var extra = !col ? '' : '\ncolumn: ' + col;
  extra += !error ? '' : '\nerror: ' + error;


  exception = isThrowNew(msg,line,file,document.location.href)
  if(exception>1){ 
    // Report this error via ajax so you can keep track
    // of what pages have JS issues
    captureError({name:error, message:msg, file:file, line:line, col:col},
      ((exception==1)?1:0))
    alert("Error: " + msg + "\nfile: " + file + "\nline: " + line + extra);
  }

  var suppressErrorAlert = true;
  // If you return true, then error alerts (like in older versions of 
  // Internet Explorer) will be suppressed.
  return suppressErrorAlert;
};
// ##### FIN : Controlador de Errores
//