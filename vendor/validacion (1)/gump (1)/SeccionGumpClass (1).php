<?php

// namespace GumppClass;

class SeccionGumpClassExeptions extends Exception
{
  private $_options;

  public function __construct(
    $message,
    $code = 0,
    Exception $previous = null,
    $options = array('params')
  ) {
    parent::__construct($message, $code, $previous);

    $this->_options = $options;
  }

  public function getOptions()
  {
    return $this->_options;
  }
}

class SeccionGumpClass
{
  public $seccion;
  private $seccionNombre;
  private $decodeParametros;

  public function __construct(array $seccion, $seccionNombre, $noLine = -1)
  {
    $this->seccionNombre = $seccionNombre;
    $this->seccion = $seccion;
    $this->decodeParametros = 0;

    // return $this->getValorDeBindAjax($seccion);
  }

  public function decodeParametros()
  {
    $this->decodeParametros = 1;
    $this->seccion = $this->seccion;
  }

  public function bindErrorSeccionGump($rules)
  {
    $fields = $this->bindErrorColumnasGump($rules);
    $errorSeccion = array('error' => array('seccion' => array($this->seccionNombre => array(
      'fields' => $fields,
    ))));
    // ini_set("display_errors", 1);
    throw new SeccionGumpClassExeptions("Hay un error en por lo menos un campo de la seccion:", 1, null, $errorSeccion);
    // try {
    //   throw new Exception("Hay un error en un campo de la seccion: ($this->seccionNombre)", 1);
    // } catch (Exception $e) {
    // }
  }

  public function getValorDeBindAjax($seccion = NULL)
  {
    if (is_null($seccion)) $seccion = $this->seccion;
    $newSeccion = array();
    foreach ($seccion as $campoNombre => $campoValorBind) {
      if (isset($campoValorBind['val'])) {
        $val =  $campoValorBind['val'];
      } else
        $val =  $campoValorBind;

      $newSeccion[$campoNombre] = $val;
    }

    return $newSeccion;
  }

  private function bindErrorColumnasGump($rules)
  {
    $newFields = array();
    foreach ($rules as $key => $value) {
      $UID = (isset($this->seccion[$key]) && isset($this->seccion[$key]['UID'])) ?
        $this->seccion[$key]['UID']
        : null;
      $newFields[$key] = array(
        'error' => $value,
        'UID' => $UID,
      );
    }

    return $newFields;
  }
}
