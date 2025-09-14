<?php

trait FormatNumber
{

  protected function formatCurrency($value)
  {
    return $this->TrimTrailingZeroes(number_format((float)$value, 2, ',', '.'));
  }
  protected function formatFloat($value)
  {
    return strtr($value, ',', '.');
  }

  protected function TrimTrailingZeroes($nbr)
  {
    return strpos($nbr, ',') !== false ? rtrim(rtrim($nbr, '0'), ',') : $nbr;
  }
}
