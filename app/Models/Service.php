<?php
namespace App\Models;

/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 11/07/2021
 * Time: 12:10
 */

use CodeIgniter\Model;

class Service extends Model{

    protected $DBGroup              = 'tests';

    protected $table                = 'dynamic_services';
    protected $primaryKey           = 'id';
    protected $useAutoIncrement     = true;
    protected $insertID             = 0;
    protected $returnType           = 'array';
    protected $useSoftDeletes       = false;
    protected $protectFields        = true;
    protected $allowedFields        = [];

    // Dates
    protected $useTimestamps        = false;
    protected $dateFormat           = 'datetime';
    protected $createdField         = 'created_at';
    protected $updatedField         = 'updated_at';
    protected $deletedField         = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks       = true;
    protected $beforeInsert         = [];
    protected $afterInsert          = [];
    protected $beforeUpdate         = [];
    protected $afterUpdate          = [];
    protected $beforeFind           = [];
    protected $afterFind            = [];
    protected $beforeDelete         = [];
    protected $afterDelete          = [];


    /**
     * @param $xml
     * @param $avantio_credentials
     * @param $ts
     * @param $ts_referencia
     */
    public function insertServices($xml,$avantio_credentials,$ts,$ts_referencia)
    {

        $db = \Config\Database::connect($this->getDBGroup());

        foreach($xml->Service as $service){
            foreach($service->Name as $trad){
                if(!in_array($trad->Language,$avantio_credentials['ACTIVED_LANGUAGES'])) continue;
                $sql = "INSERT INTO dynamic_services (id,language,text_title) VALUES ('".intval($service->Code)."','". (string)$trad->Language."','" . $db->escapeString((string)$trad->Text) ."') ON DUPLICATE KEY UPDATE text_title='" . $db->escapeString((string)$trad->Text) . "' ;";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
            }// end foreach
        } // end foreach
    } // end function



    /**
     *
     */
    private function add_two_primary_keys()
    {

        $forge = \Config\Database::forge();
        $forge->addKey('id', TRUE);
        $forge->addKey('language', TRUE);

    } // end function



    private function insertar_actualizar()
    {

        $data = [
            'id'            => "",
            'language'      => "",
            'text_title'    => ""
        ];
        $this->save($data);

    } // end function


    /**
     * @return string
     */
    public function getDBGroup()
    {
        return $this->DBGroup;
    }


    /**
     * @param string $DBGroup
     */
    public function setDBGroup($DBGroup)
    {
        $this->DBGroup = $DBGroup;
    }


    public function connect()
    {
        $this->db = \Config\Database::connect($this->getDBGroup());
    } // end function

}// end class
?>