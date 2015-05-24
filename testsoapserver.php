<?php
require_once "custom/modules/soap/nusoap.php";
 
class food {
 
    public function getFood($type) {
        switch ($type) {
            case 'starter':
                return 'Soupnew';
                break;
            case 'Main':
                return 'Curry';
                break;
            case 'Desert':
                return 'Ice Cream';
                break;
            default:
                break;
        }
		
    }
}
 
$server = new soap_server();
$server->configureWSDL("foodservicenew", "http://127.0.0.1/sugarcrm/index.php?entryPoint=soapserver");
 
$server->register("food.getFood",
    array("type" => "xsd:string"),
    array("return" => "xsd:string"),
    "http://127.0.0.1/sugarcrm/index.php?entryPoint=soapserver",
    "http://127.0.0.1/sugarcrm/index.php?entryPoint=soapserver#getFood",
    "rpc",
    "encoded",
    "Get food by type");
 
@$server->service($HTTP_RAW_POST_DATA);
?>