<?php
require("gump.class.php");

class GUMP_dd extends GUMP
{
    // --- SeccionGumpClass {
    private $sGump;

    public function setSeccionGump(array $seccion, $seccionNombre)
    {
        // $tmpseccion = $seccion;
        if (!class_exists('SeccionGumpClass')) {
            $seccion_file = __DIR__ . DIRECTORY_SEPARATOR . 'SeccionGumpClass.php';
            require $seccion_file;
        }
        $this->sGump = new SeccionGumpClass($seccion, $seccionNombre);
        return $this->sGump->getValorDeBindAjax();
    }

    public function run(array $data, $check_fields = false)
    {
        $data = parent::run($data, $check_fields);

        if ($data === false && !empty($this->sGump)) {
            $errores = $this->get_errors_array();
            $this->sGump->bindErrorSeccionGump($errores);
        }

        return $data;
    }

    // --- SeccionGumpClass }



    protected function validate_alpha_dash_num($field, $input, $param = null)
    {
        if (!isset($input[$field]) || empty($input[$field])) {
            return;
        }

        if (!preg_match('/^([a-z0-9ÀÁÂÃÄÇÈÉÊËÌÍÎÏÒÓÔÕÖßÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ_-])+$/i', $input[$field]) !== false) {
            return array(
                'field' => $field,
                'value' => $input[$field],
                'rule' => __FUNCTION__,
                'param' => $param,
            );
        }
    }

    protected function validate_valid_web($field, $input, $param = null)
    {
        if (!isset($input[$field]) || empty($input[$field])) {
            return;
        }
        if (!preg_match('/^(https?:\/\/)?(\w+\.)?(\w+)(\.\S{2,})+$/i', $input[$field]) !== false) {
            return array(
                'field' => $field,
                'value' => $input,
                'rule' => __FUNCTION__,
                'param' => $param,
            );
        }
    }

    protected function filter_empty_to_null($value, $params = null)
    {
        return empty($value) ? NULL : $value;
    }

    protected function validate_required_array($field, $input, $param = null)
    {
        if (empty($this->validate_required($field, $input, $param)))
            return;

        return array(
            'field' => $field,
            'value' => null,
            'rule' => __FUNCTION__,
            'param' => $param,
        );
    }
} // EOC

/*$validator = new GUMP_dd();*/

/*$validated = $validator->validate($_POST, $rules);*/
