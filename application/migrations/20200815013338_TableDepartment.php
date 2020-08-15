<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_TableDepartment extends CI_Migration {
    public function up() {
        $columns = array(
          'iDeptId' => array(
            'type' => 'INT',
            'auto_increment' => TRUE
          ),
          'vName' => array(
              'type' => 'VARCHAR',
              'constraint' => 100
          ),
        );
        
        $this->dbforge->add_key('iDeptId', TRUE);
        $this->dbforge->add_key('iDeptId', 'iDeptId');
        $this->dbforge->add_field($columns);
        $this->dbforge->create_table('department');
    }

    public function down() {
        $this->dbforge->drop_table('department');
    }
}
