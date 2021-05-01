<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH. '/libraries/SignatureInvalidException.php';
require APPPATH . '/libraries/JWT.php';
require APPPATH. '/libraries/BeforeValidException.php';
require APPPATH. '/libraries/ExpiredException.php';

use Restserver\Libraries\REST_Controller;
use \Firebase\JWT\JWT;

class Auth extends REST_Controller {

    function __construct() {

        // Construct the parent class
        parent::__construct();

        $this->methods['user_get']['limit'] = 500000; // 500 requests per hour per user/key
        $this->methods['user_post']['limit'] = 100000; // 100 requests per hour per user/key
        $this->methods['user_delete']['limit'] = 50; // 50 requests per hour per user/key

        // initilized models
        $this->load->model('authentication_model');

  
    }

    public function login_post() {
        $data = new stdClass();
        $data->email = $email = $this->post('email');
        $data->password = $password = $this->post('password');
        $data->level = $level = $this->post('level');

        if (!$email) {
            $invalidLogin = ['invalid' => 'Please enter email. It\'s required.'];
            $this->response($invalidLogin, REST_Controller::HTTP_NOT_FOUND);
        }
        if (!$password) {
            $invalidLogin = ['invalid' => 'Please enter password. It\'s required.'];
            $this->response($invalidLogin, REST_Controller::HTTP_NOT_FOUND);
        }

        if (empty($invalidLogin)) {
            $rules = array(
                array(
                    'field' => 'email',
                    'label' => "Email",
                    'rules' => 'trim|required',
                ),
                array(
                    'field' => 'password',
                    'label' => "Password",
                    'rules' => 'trim|required',
                ),
            );
            $this->form_validation->set_rules($rules);
            if ($this->form_validation->run() !== false) {
                $email = $this->input->post('email');
                $password = $this->input->post('password');
                // username is okey lets check the password now
                $login_credential = $this->authentication_model->login_credential($email, $password);
                if ($login_credential) {
                    if ($login_credential->active) {
                        if ($login_credential->role == 6) {
                            $userType = 'parent';
                        } elseif ($login_credential->role == 7) {
                            $userType = 'student';
                        } else {
                            $userType = 'staff';
                        }
                        $getUser = $this->application_model->getUserNameByRoleID($login_credential->role, $login_credential->user_id);
                        $getConfig = $this->db->get_where('global_settings', array('id' => 1))->row_array();
                        // get logger name
                        $token = array(
                            'name' => $getUser['name'],
                            'logger_photo' => $getUser['photo'],
                            'loggedin_branch' => $getUser['branch_id'],
                            'loggedin_id' => $login_credential->id,
                            'loggedin_userid' => $login_credential->user_id,
                            'loggedin_role_id' => $login_credential->role,
                            'loggedin_type' => $userType,
                            'set_lang' => $getConfig['translation'],
                            'set_session_id' => $getConfig['session_id'],
                            'loggedin' => true,
                        );

                        $this->db->update('login_credential', array('last_login' => date('Y-m-d H:i:s')), array('id' => $login_credential->id));

                        $date = new DateTime();
                        $token['iat'] = $date->getTimestamp();
                        $token['exp'] = $date->getTimestamp() + 60 * 60 * 24;
                        $id_token = JWT::encode($token, "user_auth");

                        $output = ['success' => TRUE, 'token' => $id_token];
                        $this->set_response($output, REST_Controller::HTTP_CREATED);
                    } else {
                        $invalidLogin = ['invalid' => translate('inactive_account')];
                        $this->set_response($invalidLogin, REST_Controller::HTTP_NOT_FOUND);
                    }
                } else {
                    $invalidLogin = ['invalid' => translate('username_password_incorrect')];
                    $this->set_response($invalidLogin, REST_Controller::HTTP_NOT_FOUND);
                }
            }
        }
    }

    public function verify_post() {
        $token = $this->input->get_request_header('Authorization');
        $token = explode(' ', $token)[1];
        try{
            $payload = JWT::decode($token, "user_auth",array('HS256'));
            $this->set_response($payload, REST_Controller::HTTP_OK);
        } catch (Exception $ex) {
            $response = array("invalid" => $ex->getMessage());
            $this->set_response($response, REST_Controller::HTTP_UNAUTHORIZED);
        }   
    }

}
