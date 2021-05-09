<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @package : Ramom school management system
 * @version : 3.0
 * @developed by : RamomCoder
 * @support : ramomcoder@yahoo.com
 * @author url : http://codecanyon.net/user/RamomCoder
 * @filename : Accounting.php
 * @copyright : Reserved RamomCoder Team
 */

class Test extends Admin_Controller
{

	public function __construct()
    {
        parent::__construct();
        $this->load->helper('api');
        $this->load->model('authentication_model');

    }

    public function index()
    {
        $email = 'umarfaiz';
                $password = 'admin1234';
                // username is okey lets check the password now
                $login_credential = $this->authentication_model->login_credential($email, $password);

                debug($login_credential);
    }
}