<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$config['migration_enabled'] = TRUE;
$config['migration_type'] = 'timestamp';
$config['migration_table'] = 'migrations';
$config['migration_auto_latest'] = TRUE;
$config['migration_version'] = '';
$config['migration_path'] = APPPATH.'migrations/';