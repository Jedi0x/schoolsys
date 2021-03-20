<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/JWT.php';

use Restserver\Libraries\REST_Controller;
use \Firebase\JWT\JWT;

class Data extends REST_Controller {

    function __construct() {
        // Construct the parent class
        parent::__construct();

        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['users_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_delete']['limit'] = 50; // 50 requests per hour per user/key
        $this->load->model(array('user_model', 'type_model'));
        $this->load->helper(array('url'));
    }

    public function index_get() {
        $this->set_response('dasda', REST_Controller::HTTP_OK);
    }

}
