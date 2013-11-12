<?php

foreach ( $_POST as $key => $value ) {
   if ($value == "clear") unset($_SESSION[$key]);
   else $_SESSION[$key]=$value;
}
		 
foreach ( $_REQUEST as $key => $value ) {
     if ($value == "clear") unset($_SESSION[$key]);
   else $_SESSION[$key]=$value;
}

	
?>