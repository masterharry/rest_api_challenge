<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migrate extends CI_Controller {

	public function index()
	{
		$this->load->library('migration');

        $result = $this->migration->current();

        if($result != FALSE) {
            echo 'Updated: '.$result;
        }
        else {
            echo 'Erro: '.$this->migration->error_string();
        }
	}
}
