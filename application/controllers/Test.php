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

class Test extends Admin_Controller
{

	public function __construct()
    {
        parent::__construct();
        $this->load->helper('api');
        $this->load->model('authentication_model');
        $this->load->model('fees_model');

    }

    public function index()
    {
       
        $months = array();
        $current_month =  date('m');
        array_push($months, $current_month);
        for ($month = 1; $month <= 12; $month++) {
            if($month != $current_month){
                array_push($months, $month);
            }
        }

        debug($months);

        

    }
    



}