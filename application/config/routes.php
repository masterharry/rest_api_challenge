<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = TRUE;

$route['api/auth/login']['post']           = 'api/auth/login';
$route['api/auth/logout']['post']          = 'api/auth/logout';

$route['api/lista/'] = 'api/lista';
$route['api/lista/(:num)'] = 'api/lista';

$route['api/employee/'] = 'api/employee';
$route['api/employee/(:num)'] = 'api/employee';

$route['api/department/'] = 'api/department';
$route['api/department/(:num)'] = 'api/department';
