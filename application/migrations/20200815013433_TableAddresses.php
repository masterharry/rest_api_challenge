<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_TableAddresses extends CI_Migration {
    public function up() {
        $columns = array(
          'iAdrId' => array(
            'type' => 'INT',
            'auto_increment' => TRUE
          ),
          'iEmpId' => array(
            'type' => 'INT',
            'constraint' => '11',
           ),
          'vAddress' => array(
              'type' => 'VARCHAR',
              'constraint' => 255
          )
        );
        
        $this->dbforge->add_key('iAdrId', TRUE);
        $this->dbforge->add_key('iAdrId', 'iAdrId');
        $this->dbforge->add_field($columns);
        $this->dbforge->create_table('addresses');
    }

    public function down() {
        $this->dbforge->drop_table('addresses');
    }
}
