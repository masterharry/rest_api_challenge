<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_TableEmployee extends CI_Migration {
    public function up() {
        $columns = array(
          'iEmpId' => array(
            'type' => 'INT',
            'auto_increment' => TRUE
          ),
          'iDeptId' => array(
            'type' => 'INT',
            'constraint' => '11',
           ),
          'vEmpUserName' => array(
              'type' => 'VARCHAR',
              'constraint' => 100
          ),
          'vEmail' => array(
            'type' => 'VARCHAR',
            'constraint' => 60
          ),
          'dtDateCreated' => array(
            'type' => 'TIMESTAMP',
          )
        );
        
        $this->dbforge->add_key('iEmpId', TRUE);
        $this->dbforge->add_key('iEmpId', 'iEmpId');
        $this->dbforge->add_field($columns);
        $this->dbforge->create_table('employee');
    }

    public function down() {
        $this->dbforge->drop_table('employee');
    }
}
