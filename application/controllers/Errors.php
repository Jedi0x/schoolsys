<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Aanttech school management system
 * @version : 3.0
 * @developed by : AanttechCoder
 * @support : Aanttechcoder@yahoo.com
 * @author url : http://codecanyon.net/user/AanttechCoder
 * @filename : Accounting.php
 * @copyright : Reserved AanttechCoder Team
 */

class Errors extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->load->view('errors/error_404_message.php');
    }
}
