<?php
namespace App\Models;

/**
 * Created by PhpStorm.
 * User: DAVID01
 * Date: 11/07/2021
 * Time: 12:10
 */

use CodeIgniter\Model;

class Kind extends Model{

    protected $DBGroup              = 'tests';

    protected $table                = 'dynamic_geocountry';
    protected $primaryKey           = 'id';
    protected $useAutoIncrement     = true;
    protected $insertID             = 0;
    protected $returnType           = 'array';
    protected $useSoftDeletes       = false;
    protected $protectFields        = true;
    protected $allowedFields = ['accommodation_id', 'occupation_rule_id' , 'fecha' , 'status'];


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
    public function insertKinds($xml,$avantio_credentials,$ts,$ts_referencia)
    {

        $db = \Config\Database::connect($this->getDBGroup());

        foreach($xml->InternationalizedKinds as $kind){
            $lang = (string)$kind->Language;
            if(!in_array($lang,$avantio_credentials['ACTIVED_LANGUAGES'])) continue;
            foreach($kind->MasterKind as $mkind){
                $mkind_id = intval($mkind->MasterKindCode);
                $mking_name = (string)$mkind->MasterKindName;
                if($lang!='ru'){
                    $auto_slug = url_semantica($mking_name);
                }else{
                    $auto_slug=str_replace(" ","-",$mking_name);
                    $auto_slug=str_replace("--","-",$auto_slug);
                }
                # status actived or paused ONLY ACTIVED VILLA
                if($mking_name != "Villa"){
                    $status = "PAUSED";
                }else{
                    $status = "ACTIVED";
                }// end if

                $sql="INSERT INTO dynamic_taxonomy (id,language,text_title,auto_slug,status) VALUES ('".$mkind_id."','".$lang."','".$db->escapeString($mking_name)."' ,'".$auto_slug."' , '".$status."') ON DUPLICATE KEY UPDATE text_title='".$db->escapeString($mking_name)."',auto_slug='".$auto_slug."' ,status='".$status."' ;";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
                $sql="INSERT INTO dynamic_taxonomy_group (id,language,text_title,auto_slug,status) VALUES ('".$mkind_id."','".$lang."','".$db->escapeString($mking_name)."','".$auto_slug."' , '".$status."') ON DUPLICATE KEY UPDATE text_title='".$db->escapeString($mking_name)."',auto_slug='".$auto_slug."' ,status='".$status."' ;";
                if (!$db->query($sql)){
                    $error = $db->error();
                    echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                    die();
                }// end if
            }// end foreach
        }// end foreach

    } // end function

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