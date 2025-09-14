<?php
require('rotation.php');
require('core/models/administrador/pdf/formatNumber.php');

class FPDF_dd extends PDF_Rotate
{
	use FormatNumber;

	//Guarda el maximo tamaño de altura (y) para hacer un cuadro o continuar con uno
	public $maxHeight;

	function RotatedText($x, $y, $txt, $angle)
	{
		//Text rotated around its origin
		$this->Rotate($angle, $x, $y);
		$this->Text($x, $y, $txt);
		$this->Rotate(0);
	}

	function Image($file, $x = null, $y = null, $w = 0, $h = 0, $type = '', $link = '')
	{
		if (!empty($file)) {
			parent::Image($file, $x, $y, $w, $h, $type, $link);
		}
	}

	function RotatedImage($file, $x, $y, $w, $h, $angle)
	{
		//Image rotated around its upper-left corner
		$this->Rotate($angle, $x, $y);
		$this->Image($file, $x, $y, $w, $h);
		$this->Rotate(0);
	}

	/*### Añadidas _dd*/
	public function GetPageWidth($param = 'M')
	{
		$width = $this->w;
		if ($param == 'A') //All
			return $width;
		$leftMargin = $this->lMargin;
		$rightMargin = $this->rMargin;
		if ($param == 'M')
			return $width - $rightMargin - $leftMargin;
	}

	public function GetPageHeight($param = 'M')
	{
		$height = $this->h;
		if ($param == 'A') //All
			return $height;
		$bottomMargin = $this->bMargin;
		$topMargin = $this->tMargin;
		if ($param == 'M')
			return $height - $bottomMargin - $topMargin;
	}

	function waterMark()
	{
		$x = $this->GetPageWidth('A') - ($this->rMargin / 2); // El ancho de toda la Pagina
		$y = $this->GetPageHeight('A') / 2;
		$this->SetFont('Arial', '', 6);
		$this->RotatedText($x, $y, 'Elaborado e impreso el ' . date('Y-m-d'), 90);
	}

	function Open()
	{
		// Begin document
		$this->state = 1;
		$this->GlobalPdf();

		// Si se quiere establecer un margen predefinido en todas 
		// las paginas se debe descomentar esta funcion.
		// $this->SetLeftMargin(5);
	}

	// Creamos una funcion donde se definiran todas las variables
	// globales
	public function GlobalPdf()
	{
		// Definicion de variables globales
	}

	function Footer()
	{
		$this->waterMark();
		$this->SetY(-15);
		$this->SetFillColor(232, 240, 253);
		$this->SetFont('Arial', 'I', 7);
		$this->Cell(0, 10, 'Pagina ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
	}

	// Calcula el valor maximo de altura que debe tener la pagina para que
	// se añada otra pagina y la guarda en lavariable indicada.
	// Se usa cuando se esta creando un cuadro o continuando
	public function setMaxHeight()
	{
		if ($this->CurOrientation == 'P')
			$this->maxHeight = 0.89 * $this->h;
		if ($this->CurOrientation == 'L')
			$this->maxHeight = 0.87 * $this->h;
	}

	// Devuelve verdarero si la proporcion en la que esta la 
	// posicion actual es la indicada para crear una nueva pagina
	// $add: si se quiere saber si sobre pasa con el tamaño nuevo de 
	// una tabla, por lo general el encabezado
	public function maxHeight($add = 0)
	{
		return $this->GetY() + $add  >= $this->maxHeight;
	}

	// Modificamos el metodo cell para que si el exto sobrepasa el tamaño de 
	// la celda, lo recorte y coloque 3 puntos suspensivos
	public function Cell($w, $h = 0, $txt = '', $border = 0, $ln = 0, $align = '', $fill = false, $link = '')
	{
		//### [Recorte-texto] Recortamos el texto si es mas largo que el ancho de la  celda
		$txt = $this->prepareTxtToCell($txt, $w);

		parent::Cell($w, $h, $txt, $border, $ln, $align, $fill, $link);
	}

	// Recortamos el texto y se le coloca un finalizador(...)
	private function prepareTxtToCell($txt, $w)
	{
		if ($w < 1) //Este se coloca, por los textos que son generales (header,footer...)
			return $txt;
		$txtW = $this->GetStringWidth($txt); //tamaño de la cadena
		$maxWCell = $w - 1.1; //Tamaño maximo de elementos en la celda
		if ($txtW > $maxWCell && $w > 0) { //Si la cadena sobrepasa el tamaño de celda
			$final = '...';
			$pointsW = $this->GetStringWidth($final); //Tamaño de los puntos suspensivos

			$caracW = $txtW / strlen($txt); //Tamaño promedio de cada caracter
			$caracDel = ceil(($txtW - $maxWCell + $pointsW) / $caracW); //Caracteres finales a eliminar
			$txt = substr($txt, 0, -$caracDel) . $final;
		}
		return $txt;
	}

	function SetWidths($w)
	{
		$this->widths = $w;
	}

	function RowMultiCell($data)
	{
		$nb = 0;
		for ($i = 0; $i < count($data); $i++)
			$nb = max($nb, $this->NbLines($this->widths[$i], $data[$i]));
		$h = 5 * $nb;
		$this->CheckPageBreak($h);
		for ($i = 0; $i < count($data); $i++) {
			$w = $this->widths[$i];
			$a = isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
			$x = $this->GetX();
			$y = $this->GetY();
			$this->Rect($x, $y, $w, $h);
			$this->MultiCell($w, 5, $data[$i], 0, $a);
			$this->SetXY($x + $w, $y);
		}
		$this->Ln($h);
	}

	function CheckPageBreak($h)
	{
		if ($this->GetY() + $h > $this->PageBreakTrigger)
			$this->AddPage($this->CurOrientation);
	}

	function NbLines($w, $txt)
	{
		$cw = &$this->CurrentFont['cw'];
		if ($w == 0)
			$w = $this->w - $this->rMargin - $this->x;
		$wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
		$s = str_replace("\r", '', $txt);
		$nb = strlen($s);
		if ($nb > 0 and $s[$nb - 1] == "\n")
			$nb--;
		$sep = -1;
		$i = 0;
		$j = 0;
		$l = 0;
		$nl = 1;
		while ($i < $nb) {
			$c = $s[$i];
			if ($c == "\n") {
				$i++;
				$sep = -1;
				$j = $i;
				$l = 0;
				$nl++;
				continue;
			}
			if ($c == ' ')
				$sep = $i;
			$l += $cw[$c];
			if ($l > $wmax) {
				if ($sep == -1) {
					if ($i == $j)
						$i++;
				} else
					$i = $sep + 1;
				$sep = -1;
				$j = $i;
				$l = 0;
				$nl++;
			} else
				$i++;
		}
		return $nl;
	}
	/*### FIN Añadidas _dd*/
}
