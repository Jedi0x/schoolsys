<?

require_once dirname(__FILE__) . '/tcpdf/tcpdf.php';


class XYZ extends TCPDF
{
	
	function __construct()
	{
		parent::__construct();
	}

	public function voucher()
	{
		echo dirname(__FILE__) . '/tcpdf/tcpdf.php';
		exit();
	
	}
}