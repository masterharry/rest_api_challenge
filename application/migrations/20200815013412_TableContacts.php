<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_TableContacts extends CI_Migration {
    public function up() {
        $columns = array(
          'iCntactId' => array(
            'type' => 'INT',
            'auto_increment' => TRUE
          ),
          'iEmpId' => array(
            'type' => 'INT',
            'constraint' => '11',
           ),
          'vNumber' => array(
              'type' => 'VARCHAR',
              'constraint' => 255
          )
        );
        
        $this->dbforge->add_key('iCntactId', TRUE);
        $this->dbforge->add_key('iCntactId', 'iCntactId');
        $this->dbforge->add_field($columns);
        $this->dbforge->create_table('contacts');
    }

    public function down() {
        $this->dbforge->drop_table('contacts');
    }
}
