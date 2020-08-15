<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_RelationsTable extends CI_Migration {
    public function up() {
        $this->db->query("ALTER TABLE `keys`
          ADD CONSTRAINT `keys_ibfk_1` FOREIGN KEY (`iUserId`) REFERENCES `login` (`iUserId`),
          ADD CONSTRAINT `keys_ibfk_3` FOREIGN KEY (`vKey`) REFERENCES `login` (`vToken`);");
          $this->db->query("ALTER TABLE `keys` ADD UNIQUE(`vKey`);");
          $this->db->query("ALTER TABLE `login` ADD UNIQUE(`vEmail`);");
          $this->db->query("ALTER TABLE `login` ADD UNIQUE(`vToken`);");
          $this->db->query("INSERT INTO `login` (`iUserId`, `vEmail`, `vPassword`, `vToken`) VALUES (NULL, 'er.hirenmaster@gmail.com', '123456', 'masterpasskey');");
          $this->db->query("INSERT INTO `keys` (`iKeyId`, `iUserId`, `vKey`, `iLevel`, `iIgnoreLimits`, `iIsPrivateKey`, `vIPAddresse`, `dtDateCreated`) VALUES (NULL, '1', 'masterpasskey', '', '0', '0', NULL, '');");
    }

    public function down() {

    }
}
