<?php
use Swagger\Annotations as SWG;
/**
 * @package
 * @category
 * @subpackage
 *
 * @SWG\Resource(
 *  apiVersion="0.1",
 *  swaggerVersion="1.2",
 *  resourcePath="/employee",
 *  basePath="http://localhost/rest_api/api/",
 *  produces="['application/json']",
 * )
 */
defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH . '/libraries/REST_Controller.php';

class Employee extends REST_Controller {
    function __construct()
    {
        parent::__construct();
        if (isset($_SERVER['HTTP_ORIGIN'])) {
            header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
            header('Access-Control-Allow-Credentials: true');
            header('Access-Control-Max-Age: 86400');
        }
        if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
            if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
                header("Access-Control-Allow-Methods: GET, POST, PUT,DELETE, OPTIONS");
            if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
                header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
            exit(0);
        }

    }

  /**
   *
   * @SWG\Api(
   *   path="employee",
   *   description="list of api",
   *   @SWG\Operations(
   *     @SWG\Operation(
   *       method="GET",
   *       summary="view or search employee",
   *       notes="Returns a string",
   *       nickname="hiren",
   *       @SWG\Parameters(
   *         @SWG\Parameter(
   *           name="id",
   *           description="id table",
   *           paramType="query",
   *           required=false,
   *           type="string"
   *         ),
   *         @SWG\Parameter(
   *           name="q",
   *           description="search by name or email",
   *           paramType="query",
   *           required=false,
   *           type="string"
   *         ),
   *       ),
   *       @SWG\ResponseMessages(
   *          @SWG\ResponseMessage(
   *            code=400,
   *            message="Invalid username"
   *          ),
   *          @SWG\ResponseMessage(
   *            code=404,
   *            message="Not found"
   *          )
   *       )
   *     )
   *   )
   * )
   */

    public function index_get()
    {
        $id = $this->get('id');
        $search_query = $this->get('q');
        $offset = $this->get('offset');
        $limit = $this->get('limit');
        $this->load->model('servicesmodel');
        $data = [];
        if($id == null) {
          $response = $this->servicesmodel->get('employee', $data , null, null,$search_query);
       } else {
         if($limit == null) { $limit == 20; }
         if($offset == null) { $offset == 0; }
         $data = array('iEmpId' => $id);
         $response = $this->servicesmodel->get('employee', $data , $limit, $offset,$search_query);
       }
       if($response) {
         $this->response($response, REST_Controller::HTTP_OK);
       } else {
         $this->set_response([
            'status' => FALSE,
            'message' => 'Response could not be found'
        ], REST_Controller::HTTP_NOT_FOUND);
       }
    }


    /**
     *
     * @SWG\Api(
     *   path="employee",
     *   @SWG\Operations(
     *     @SWG\Operation(
     *       method="post",
     *       summary="add employee",
     *       notes="Returns a string",
     *       nickname="hiren",
     *       @SWG\Parameters(
     *         @SWG\Parameter(
     *           name="body",
     *           description="id table",
     *           paramType="body",
     *           required=false,
     *           type="employee"
     *         ),
     *       ),
     *       @SWG\ResponseMessages(
     *          @SWG\ResponseMessage(
     *            code=400,
     *            message="Invalid username"
     *          ),
     *          @SWG\ResponseMessage(
     *            code=404,
     *            message="Not found"
     *          )
     *       )
     *     )
     *   )
     * )
     */

    public function index_post()
    {
      $dept_id = $this->post('dept_id');
      $name = $this->post('username');
      $email = $this->post('email');

      $contact_numbers = $this->post('contact_numbers');
      $addresses = $this->post('addresses');
     
      if($name != null AND $email != null AND $dept_id > 0){
        $this->load->model('servicesmodel');
        $data = array(
          'vEmpUserName' => $name,
          'iDeptId' => $dept_id,
          'vEmail' => $email
        );
        $response = $this->servicesmodel->post('employee', $data,'iEmpId');

        // add multiple contacts
        if(!empty($contact_numbers)){
          foreach($contact_numbers as $key => $value){
            $contact_data = array(
              'iEmpId' => $response['response'][0]->iEmpId,
              'vNumber' => $value,
            );
            $contact_response = $this->servicesmodel->post('contacts', $contact_data,'iCntactId');
          }
        }

        // add multiple addresses
        if(!empty($addresses)){
          foreach($addresses as $key => $value){
            $adr_data = array(
              'iEmpId' => $response['response'][0]->iEmpId,
              'vAddress' => $value,
            );
            $address_response = $this->servicesmodel->post('addresses', $adr_data,'iAdrId');
          }
        }
        
      } else {
        $response = null;
      }
      
      if($response != null) {
        $this->response($response, REST_Controller::HTTP_OK);
      } else {
        if($dept_id == 0){
            $this->set_response([
              'status' => FALSE,
              'message' => 'Department Id should not be zero'
          ], REST_Controller::HTTP_OK);
        }else{
          $this->set_response([
              'status' => FALSE,
              'message' => 'Field null set properly [ dept_id, username, email]'
          ], REST_Controller::HTTP_OK);
        }
      }
    }

  /**
   *
   * @SWG\Api(
   *   path="employee",
   *   description="list of api",
   *   @SWG\Operations(
   *     @SWG\Operation(
   *       method="PUT",
   *       summary="update employee",
   *       notes="Returns a string",
   *       nickname="hiren",
   *       @SWG\Parameters(
   *         @SWG\Parameter(
   *           name="body",
   *           description="body",
   *           paramType="body",
   *           required=false,
   *           type="upd_employee"
   *         ),
   *       ),
   *       @SWG\ResponseMessages(
   *          @SWG\ResponseMessage(
   *            code=400,
   *            message="Invalid username"
   *          ),
   *          @SWG\ResponseMessage(
   *            code=404,
   *            message="Not found"
   *          )
   *       )
   *     )
   *   )
   * )
   */

    public function index_put()
    {
      $id = $this->put('id');
      $dept_id = $this->put('dept_id');
      $name = $this->put('username');
      $email = $this->put('email');
      if($id != null) {
        $data = [];
        if($dept_id != null) {
          $data['iDeptId'] = $dept_id;
        }
        if($name != null) {
          $data['vEmpUserName'] = $name;
        }
        if($email != null) {
          $data['vEmail'] = $email;
        }
        $this->load->model('servicesmodel');

        // function put($table, $field, $values, $data)
        $response = $this->servicesmodel->put('employee', 'iEmpId', $id, $data);

      } else {
        $response = false;
      }
      if($response) {
        $this->response($response, REST_Controller::HTTP_OK);
      } else {
        $this->set_response([
           'status' => FALSE,
           'message' => 'Field null set [id*, dept_id, username, email]'
       ], REST_Controller::HTTP_OK);
      }
    }

  /**
   *
   * @SWG\Api(
   *   path="employee",
   *   description="list of api",
   *   @SWG\Operations(
   *     @SWG\Operation(
   *       method="DELETE",
   *       summary="Delete employee by id",
   *       notes="Returns a string",
   *       nickname="hiren",
   *       @SWG\Parameters(
   *         @SWG\Parameter(
   *           name="id",
   *           description="id table",
   *           paramType="query",
   *           required=false,
   *           type="string"
   *         ),
   *       ),
   *       @SWG\ResponseMessages(
   *          @SWG\ResponseMessage(
   *            code=400,
   *            message="Invalid username"
   *          ),
   *          @SWG\ResponseMessage(
   *            code=404,
   *            message="Not found"
   *          )
   *       )
   *     )
   *   )
   * )
   */

    public function index_delete()
    {
      $id = $this->input->get('id');
      if($id != null) {
        $this->load->model('servicesmodel');
        $response = $this->servicesmodel->delete('employee', 'iEmpId', $id);
      } else {
        $response = false;
      }
      if($response) {
        $this->response($response, REST_Controller::HTTP_OK);
      } else {
        $this->set_response([
           'status' => FALSE,
           'message' => 'Field id null, set id'
       ], REST_Controller::HTTP_OK);
      }
    }
}
/**
 * @SWG\Model(id="employee",
 *     @SWG\Property(name="dept_id",type="integer"),
 *     @SWG\Property(name="username",type="string"),
 *     @SWG\Property(name="email",type="string"),
 *     @SWG\Property(name="contact_numbers",type="array", @SWG\Items("9876543210")),
 *     @SWG\Property(name="addresses",type="array", @SWG\Items("Sample Address 1")),
 * )
*/

/**
 * @SWG\Model(id="upd_employee",required="id",
 *     @SWG\Property(name="id",type="integer"),
 *     @SWG\Property(name="dept_id",type="integer"),
 *     @SWG\Property(name="username",type="string"),
 *     @SWG\Property(name="email",type="string"),
 * )
*/
