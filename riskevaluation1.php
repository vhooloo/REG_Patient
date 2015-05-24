<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

echo "Here I am";

require_once('include/SugarPHPMailer.php'); 

$emailObj = new Email(); 
$defaults = $emailObj->getSystemDefaultEmail(); 

$mail = new SugarPHPMailer(); 
$mail->setMailerForSystem(); 
//$mail->From = $defaults['email']; 
$mail->IsSMTP(); // telling the class to use SMTP
$mail->Host       = "mail.vinksoftware.com"; // SMTP server

$mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)

// 1 = errors and messages

// 2 = messages only

$mail->SMTPAuth   = true;                  // enable SMTP authentication
//$mail->SMTPSecure = 'tls';

$mail->Port       = 26;                    // set the SMTP port for the GMAIL server

$mail->Username   = "vinay.hooloomann@vinksoftware.com"; // SMTP account username

$mail->Password   = "Micore12";        // SMTP account password

 
$mail->SetFrom('vinay.hooloomann@vinksoftware.com', 'Vinay Hooloomann');

//$mail->AddReplyTo('vhooloo@gmail.com', 'Vinay Hooloomann');

$mail->Subject    = "PHPMailer Test Subject via smtp, basic with authentication";
$address = "vhooloo@yahoo.com";

$mail->AddAddress($address, "Vinay Hooloomann");
 
$mail->Body = 'Test'; 
//$mail->prepForOutbound(); 
//$mail->AddAddress($email); 
$mail->Send();
echo "sent";
?>