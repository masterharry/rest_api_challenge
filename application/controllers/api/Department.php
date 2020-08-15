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
 *  resourcePath="/department",
 *  basePath="http://localhost/rest_api/api/",
 *  produces="['application/json']",
 * )
 */
defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH . '/libraries/REST_Controller.php';

class Department extends REST_Controller {
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
   *   path="department",
   *   description="list of api",
   *   @SWG\Operations(
   *     @SWG\Operation(
   *       method="GET",
   *       summary="View Department",
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

    public function index_get()
    {
        $id = $this->get('id');
        $offset = $this->get('offset');
        $limit = $this->get('limit');
        $this->load->model('servicesmodel');
        $data = [];
        if($id == null) {
          $response = $this->servicesmodel->get('department', $data , null, null);
       } else {
         if($limit == null) { $limit == 20; }
         if($offset == null) { $offset == 0; }
         $data = array('iDeptId' => $id, );
         $response = $this->servicesmodel->get('department', $data , $limit, $offset);
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
     *   path="department",
     *   @SWG\Operations(
     *     @SWG\Operation(
     *       method="post",
     *       summary="add department",
     *       notes="Returns a string",
     *       nickname="hiren",
     *       @SWG\Parameters(
     *         @SWG\Parameter(
     *           name="body",
     *           description="id table",
     *          paramType="body",
     *          required=false,
     *          type="department"
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
      $name = $this->post('name');
      if($name != null){
        $this->load->model('servicesmodel');
        $data = array(
          'vName' => $name,
        );
        $response = $this->servicesmodel->post('department', $data,'iDeptId');
      } else {
        $response = null;
      }

      if($response != null) {
        $this->response($response, REST_Controller::HTTP_OK);
      } else {
        $this->set_response([
           'status' => FALSE,
           'message' => 'Field null set [name]'
       ], REST_Controller::HTTP_OK);
      }
    }
}
/**
 * @SWG\Model(id="department", required="name",
 *     @SWG\Property(name="name",type="string"),
 * )
*/
