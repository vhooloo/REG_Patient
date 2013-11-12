<?php

foreach ( $_POST as $key => $value ) {
   $_SESSION[$key]=$value;
}
		 
foreach ( $_REQUEST as $key => $value ) {
  $_SESSION[$key]=$value;
}

	
?>