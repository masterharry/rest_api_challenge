<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH . '/libraries/REST_Controller.php';

class Auth extends REST_Controller {
    function __construct()
    {
        parent::__construct();
        if (isset($_SERVER['HTTP_ORIGIN'])) {
            header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
            header('Access-Control-Allow-Credentials: true');
            header('Access-Control-Max-Age: 86400');
        }
        if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
            if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
                header("Access-Control-Allow-Methods: GET, POST, PUT,DELETE, OPTIONS");
            if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
                header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
            exit(0);
        }
    }
    public function index_get() {
      $email = $this->get('email');
      $pass = $this->get('password');

      if($email != null AND $pass != null) {
          $this->load->model('servicesmodel');
          $data = array(
            'vEmail' => $email,
            'vPassword' => md5($pass)
          );
          $query = $this->servicesmodel->get('login', $data , null, null);
          if(count($query['response']) >= 1) {
            $this->response($query, REST_Controller::HTTP_OK);
          } else {
            $this->set_response([
               'status' => FALSE,
               'message' => 'Error, your login not found!'
           ], REST_Controller::HTTP_OK);
          }

      } else {
        $this->set_response([
           'status' => FALSE,
           'message' => 'Erro, your login not found!'
       ], REST_Controller::HTTP_NOT_FOUND);
      }
    }

}
