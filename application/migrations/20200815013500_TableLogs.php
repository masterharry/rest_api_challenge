<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_TableLogs extends CI_Migration {
    public function up() {
        $columns = array(
          'iLogId' => array(
            'type' => 'INT',
            'auto_increment' => TRUE
          ),
          'vURI' => array(
            'type' => 'VARCHAR',
            'constraint' => '255',
           ),
          'vMethod' => array(
            'type' => 'VARCHAR',
            'constraint' => '6',
           ),
          'tParams' => array(
            'type' => 'TEXT',
            'default' => null
           ),
          'vApiKey' => array(
            'type' => 'VARCHAR',
            'constraint' => '40',
           ),
          'vIpAddress' => array(
            'type' => 'VARCHAR',
            'constraint' => '45',
           ),
          'iTime' => array(
            'type' => 'INT',
            'constraint' => '11',
           ),
          'fRTime' => array(
            'type' => 'FLOAT',
            'default' => null
           ),
          'vAuthorized' => array(
            'type' => 'VARCHAR',
            'constraint' => '1',
           ),
          'iResponseCode' => array(
            'type' => 'smallint',
            'constraint' => '3',
            'default' => '0'
           )
        );
        $this->dbforge->add_key('iLogId', TRUE);
        $this->dbforge->add_key('iLogId', 'iLogId');
        $this->dbforge->add_key('vURI', 'vURI');
        $this->dbforge->add_key('vApiKey', 'vApiKey');
        $this->dbforge->add_key('iResponseCode', 'iResponseCode');
        $this->dbforge->add_field($columns);
        $this->dbforge->create_table('logs');
    }

    public function down() {
        $this->dbforge->drop_table('logs');
    }
}
