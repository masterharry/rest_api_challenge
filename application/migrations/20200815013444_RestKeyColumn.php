<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_RestKeyColumn extends CI_Migration {
    public function up() {
        $colunas = array(
          'iKeyId' => array(
            'type' => 'INT',
            'auto_increment' => TRUE
          ),
          'iUserId' => array(
            'type' => 'INT',
            'constraint' => '11'
          ),
          'vKey' => array(
            'type' => 'VARCHAR',
            'constraint' => '40'
          ),
          'iLevel' => array(
            'type' => 'INT',
            'constraint' => '2'
          ),
          'iIgnoreLimits' => array(
            'type' => 'TINYINT',
            'constraint' => '1',
            'default' => '0'
          ),
          'iIsPrivateKey' => array(
            'type' => 'TINYINT',
            'constraint' => '1',
            'default' => '0'
          ),
          'vIPAddresse' => array(
            'type' => 'TEXT',
            'unsigned' => TRUE,
            'default' => NULL
           ),
          'dtDateCreated' => array(
            'type' => 'TIMESTAMP',
          )

        );
        $this->dbforge->add_key('iKeyId', TRUE);
        $this->dbforge->add_key('iKeyId', 'iKeyId');
        $this->dbforge->add_key('iUserId', 'iUserId');
        $this->dbforge->add_key('vKey', 'vKey');
        $this->dbforge->add_field($colunas);
        $this->dbforge->create_table('keys');

    }

    public function down() {
        $this->dbforge->drop_table('keys');
    }
}
