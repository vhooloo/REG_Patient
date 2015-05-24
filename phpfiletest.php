<?php
            header( 'Content-Type: text/csv' );
            header( 'Content-Disposition: attachment;filename=test.csv');
$out = fopen('php://output', 'w');
fputcsv($out, array('this','is some', 'csv "stuff", you know.'));
fclose($out);
?>