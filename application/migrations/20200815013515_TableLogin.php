<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_TableLogin extends CI_Migration {
    public function up() {
        $columns = array(
          'iUserId' => array(
            'type' => 'INT',
            'auto_increment' => TRUE
          ),
          'vLogo' => array(
            'type' => 'longblob',
          ),
          'vName' => array(
            'type' => 'VARCHAR',
            'constraint' => 60
          ),
          'vEmail' => array(
            'type' => 'VARCHAR',
            'constraint' => 60
          ),
          'vPassword' => array(
            'type' => 'VARCHAR',
            'constraint' => 60
          ),
          'vNumber' => array(
            'type' => 'VARCHAR',
            'constraint' => '40'
          ),
          'eStatus' => array(
            'type' => 'enum("D","A","L","E")',
            'default'=> "D",
            'comment' => '[D]activated, [A]ctive, [L]ocked, [E]xcluded'
          ),
          'vToken' => array(
            'type' => 'VARCHAR',
            'constraint' => '40'
          ),
          'dtDateCreated' => array(
            'type' => 'TIMESTAMP',
          )
        );
        $this->dbforge->add_key('iUserId', TRUE);
        $this->dbforge->add_key('iUserId', 'iUserId');
        $this->dbforge->add_key('vEmail', 'iUserId');
        $this->dbforge->add_key('vToken', 'vToken');
        $this->dbforge->add_field($columns);
        $this->dbforge->create_table('login');
    }

    public function down() {
        $this->dbforge->drop_table('login');
    }
}
