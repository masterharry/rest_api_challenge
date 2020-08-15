###################
REST API With LDAP Authentication including SWAGGER UI Built With CODEIGNITER FRAMEWORK
###################

*******************
Setup Project 
*******************

Extract downloaded folder into your /var/www or /var/www/html folder and go to that folder...

*******************
Run Migration using below command,
*******************

php index.php migrate

or you can take import sql file from database folder.

*******************
Change below in config/config.php,
*******************

$config['base_url'] = 'YOUR-URL-HERE';

*******************
Change below in config/database.php,
*******************

'hostname' => 'LOCAL-HOST',
'username' => 'MYSQL-USERNAME',
'password' => 'MYSQL-PASSWORD',
'database' => 'MYSQL-DATABASE-NAME',

update your file in 

.. code-block:: http

    docs/index.html line 31 url = "YOUR-URL-HERE/docs/json";
    
ssh or cmd
    
.. code-block:: bash

   $ cd docs/php

   $ php swagger.phar /YOUR-PROJECT-FOLDER-PATH/application/controllers -o /YOUR-PROJECT-FOLDER-PATH/docs/json

After run above command, json files will be created which you can see in /docs/json/ path.

*******************
Api key usage from swagger
*******************

.. code-block:: http

    docs/index.html 64 window.authorizations.add("YOUR-KEY-NAME", new ApiKeyAuthorization("YOUR-KEY-NAME", key, "header"));
    
*******************
Set default key swagger
*******************

.. code-block:: http

    docs/index.html 73 var apiKey = "YOUR-DEFAULT-KEY";

*******************
Change in file controller
*******************
.. code-block:: bash

    use Swagger\Annotations as SWG;
    /**
     * @package
     * @category
     * @subpackage
     *
     * @SWG\Resource(
     *  apiVersion="0.1",
     *  swaggerVersion="1.2",
     *  resourcePath="/lista",
     *  basePath="YOUR-URL-HERE/api/",
     *  produces="['application/json']",
     * )
     */


###################
Run Project
###################

You can explore list of api on below url,
http://YOUR-URL-HERE/docs/


###################
What is CodeIgniter
###################

CodeIgniter is an Application Development Framework - a toolkit - for people
who build web sites using PHP. Its goal is to enable you to develop projects
much faster than you could if you were writing code from scratch, by providing
a rich set of libraries for commonly needed tasks, as well as a simple
interface and logical structure to access these libraries. CodeIgniter lets
you creatively focus on your project by minimizing the amount of code needed
for a given task.

*******************
Server Requirements
*******************

PHP version 5.6 or newer is recommended.

It should work on 5.3.7 as well, but we strongly advise you NOT to run
such old versions of PHP, because of potential security and performance
issues, as well as missing features.
